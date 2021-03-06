package edu.njit.cs631citylib;

import java.awt.Color;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.swing.JDialog;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import java.lang.*;
import javax.swing.JButton;
import java.awt.Label;

import java.text.*;
import java.time.LocalDateTime;

public class Borrow extends JDialog {

	private final JPanel contentPanel = new JPanel();
	private JTable tableDocBorrowResult;
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			Database m = Database.getInstance();
			m.connect();
			Borrow dialog = new Borrow("1");
			dialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			dialog.setVisible(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * Create the dialog.
	 */
	public Borrow(String cardNumber) {
		setTitle("City Library");
		
		Database m = Database.getInstance();
		
		String[] columnNames = {"BorrowNo", "ReaderId", "DocId", "CopyNo", "LibId", "BDTime", "RDTime", "Fine(cents)"};
		ArrayList<ArrayList<Object>> borrowResult = new ArrayList<ArrayList<Object>>();
		
		borrowResult = m.execQuery("SELECT `BOR_NO`, `RID`, `DOCID`, `COPYNO`, `BID`, `BDTIME`, `RDTIME` FROM `BORROWS` WHERE `RID` = " + cardNumber + ";");

		Object[][] array = new Object[borrowResult.size()+1][];
		double count = 0;
		for (int i = 0; i < borrowResult.size(); i++) {
			ArrayList<Object> row = borrowResult.get(i);
			Date a = (Date)row.get(5);
			//int bday= a.getDayOfMonth();
			Date b = (Date)row.get(6);
			//int rday= b.getDayOfMonth();
			long diff = 0;
			if (b == null){
				long b2 = System.currentTimeMillis();
				//b2 = b2 / 86400000;
				//LocalDateTime b3 =
				diff = b2 - a.getTime();
				}
			else{
				diff =  b.getTime() - a.getTime();
				}
			double diff1 = (double)diff / 86400000;
			if (diff1 > 20){
				diff1= diff1 - 20;
				double diff2 = Math.ceil(diff1);
				row.add(20*diff2);
				count = count + 20*diff2;
			}
			else{
				row.add(0.0);
			}
			array[i] = row.toArray();
		}
		List <String>list1 = new ArrayList<String>();
		for (int i = 0; i < 7; i++){
			list1.add("");
		}
		DecimalFormat df=new DecimalFormat(".##");
		count = count/ borrowResult.size();
		String result = df.format(count);
		list1.add("Average: "+result);
		
		array[borrowResult.size()] = list1.toArray();									
		
		if (borrowResult == null || borrowResult.size() <= 0){
			JOptionPane.showMessageDialog(null, "No Borrowed Documents");
		}

		DefaultTableModel tm = new DefaultTableModel(array, columnNames);
		
		setBounds(100, 100, 1358, 610);
		getContentPane().setLayout(null);
		contentPanel.setBounds(0, 0, 1352, 582);
		contentPanel.setBackground(new Color(255,250,250));
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
		getContentPane().add(contentPanel);
		contentPanel.setLayout(null);
	
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setBounds(16, 51, 1240, 444);
		contentPanel.add(scrollPane);
	    scrollPane.setBackground(new Color(255,250,250));
		tableDocBorrowResult = new JTable();
		scrollPane.setViewportView(tableDocBorrowResult);
		tableDocBorrowResult.setModel(tm);
		
		Label label = new Label("Borrowed Docs:");
		label.setBounds(6, 10, 187, 35);
		contentPanel.add(label);

	}
}

