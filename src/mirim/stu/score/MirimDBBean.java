package mirim.stu.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MirimDBBean {
	
    private static MirimDBBean instance = new MirimDBBean();
    
    public static MirimDBBean getInstance() {
        return instance;
    }
    
    public MirimDBBean() { }
	
	private Connection getConnection() throws Exception {
	    Context initCtx = new InitialContext();
	    Context envCtx = (Context) initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/basicjsp");
	    return ds.getConnection();
	}
	
	
	public int stuCheck(int num, String passwd)throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
	
		try{
			conn = getConnection();
			
			pstmt = conn.prepareStatement(
					"select stu_pw from STUDENT where stu_num = ?");
			pstmt.setInt(1, num);
			rs= pstmt.executeQuery();

			if(rs.next()){
				dbpasswd= rs.getString("stu_pw"); 
				if(dbpasswd.equals(passwd))
					x = 1; 
				else
					x = 0; 
				}else
					x = -1;
					
			}catch(Exception ex) {
				ex.printStackTrace();
			}finally{
				if (rs != null) 
					try { rs.close(); } catch(SQLException ex) {}
				if (pstmt != null) 
					try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) 
					try { conn.close(); } catch(SQLException ex) {}
			}
		return x;
	}
	
	public void calculateTotal(int sc_num,int sc_score)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			        
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(
			    "select * from student where stu_num = ?");
			pstmt.setInt(1, sc_num);
			rs = pstmt.executeQuery();

			if(rs.next()){
			updateMember(rs.getInt("stu_num"), rs.getString("stu_name"), (rs.getInt("stu_total")+sc_score), rs.getInt("stu_pw"));
		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
	}
	
	public void insertStudent(StudentDataBean student) 
		              throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
			        
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "insert into student values (?,?,?,?)");
			pstmt.setInt(1, student.getStu_num());
			pstmt.setString(2, student.getStu_name());
			pstmt.setInt(3, student.getStu_total());
			pstmt.setInt(4, student.getStu_pw());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
	}
	public void insertScore(ScoreDataBean score) 
            throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			
			try{
				conn = getConnection();
	            
				pstmt = conn.prepareStatement(
						"insert into score values (?,?,NOW(),?,?,?)");
				pstmt.setInt(1, 0);
				pstmt.setInt(2, score.getSc_num());
				pstmt.setString(3, score.getSc_content());
				pstmt.setInt(4, score.getSc_plus());
				pstmt.setInt(5, score.getSc_minus());
				pstmt.executeUpdate();
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				if (pstmt != null) 
					try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) 
					try { conn.close(); } catch(SQLException ex) {}
			}
			calculateTotal(score.getSc_num(), (score.getSc_plus()+score.getSc_minus()));
	}
	public void deleteStudent(int stu_num) 
            throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rs;
		
			try{
				conn = getConnection();
			    
				pstmt = conn.prepareStatement(
					"delete from student where stu_num = ?");
				pstmt.setInt(1, stu_num);
				rs= pstmt.executeUpdate();

			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				if (pstmt != null) 
					try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) 
					try { conn.close(); } catch(SQLException ex) {}
			}
	}
	public void deleteScore(int sc_list) 
            throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rs;
			ResultSet rs2;
		
			try{
				conn = getConnection();
				pstmt = conn.prepareStatement(
						"select * from score where sc_list = ?");
				rs2 = pstmt.executeQuery();
				calculateTotal(rs2.getInt("sc_num"), ((rs2.getInt("sc_minus")+rs2.getInt("sc_plus"))*(-1)));
				pstmt = conn.prepareStatement("delete from score where sc_list = ?");
				pstmt.setInt(1, sc_list);
				rs= pstmt.executeUpdate();

			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				if (pstmt != null) 
					try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) 
					try { conn.close(); } catch(SQLException ex) {}
			}
	}
	public void updateMember(int stu_num, String stu_name, int stu_total, int stu_pw) 
            throws Exception {
			Connection conn = null;
			PreparedStatement pstmt = null;
			int rs;
		
			try{
				conn = getConnection();
			    
				pstmt = conn.prepareStatement(
					"update student set stu_num=?, stu_name=?, stu_total=? where stu_num=?");
				pstmt.setInt(1, stu_num);
				pstmt.setString(2, stu_name);
				pstmt.setInt(3, stu_total);
				pstmt.setInt(4, stu_num);
				rs= pstmt.executeUpdate();
				

			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				if (pstmt != null) 
					try { pstmt.close(); } catch(SQLException ex) {}
				if (conn != null) 
					try { conn.close(); } catch(SQLException ex) {}
			}
	}
	
	
	public List<StudentDataBean> listStudent() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StudentDataBean> listmembers= null ;
		
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select * from student");
			rs= pstmt.executeQuery();
			if(rs.next()){
				listmembers= new ArrayList<StudentDataBean>();
				do{
				
					StudentDataBean listmember = new StudentDataBean();
					listmember.setStu_num(rs.getInt("stu_num"));
					listmember.setStu_name(rs.getString("stu_name"));
					listmember.setStu_total(rs.getInt("stu_total"));
					listmember.setStu_pw(rs.getInt("stu_pw"));
					listmembers.add(listmember);
				}while(rs.next());
			}
						
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return listmembers;
	}
	public List<StudentDataBean> listStudent_Grade(String grade) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StudentDataBean> listmembers= null ;
		
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select * from student where substring(concat(stu_num),1,1) = ? ");
			pstmt.setString(1, grade);
			rs= pstmt.executeQuery();
			if(rs.next()){
				listmembers= new ArrayList<StudentDataBean>();
				do{
				
					StudentDataBean listmember = new StudentDataBean();
					listmember.setStu_num(rs.getInt("stu_num"));
					listmember.setStu_name(rs.getString("stu_name"));
					listmember.setStu_total(rs.getInt("stu_total"));
					listmember.setStu_pw(rs.getInt("stu_pw"));
					listmembers.add(listmember);
				}while(rs.next());
			}
						
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return listmembers;
	}
	public List<StudentDataBean> listStudent_Class(String class1) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<StudentDataBean> listmembers= null ;
		System.out.println(class1);
		
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select * from student where substring(concat(stu_num),1,2) = ? ");
			pstmt.setString(1, class1);
			rs= pstmt.executeQuery();
			if(rs.next()){
				listmembers= new ArrayList<StudentDataBean>();
				do{
				
					StudentDataBean listmember = new StudentDataBean();
					listmember.setStu_num(rs.getInt("stu_num"));
					listmember.setStu_name(rs.getString("stu_name"));
					listmember.setStu_total(rs.getInt("stu_total"));
					listmember.setStu_pw(rs.getInt("stu_pw"));
					listmembers.add(listmember);
				}while(rs.next());
			}
						
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return listmembers;
	}
	public List<ScoreDataBean> listScore() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ScoreDataBean> listmembers= null ;
		
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select * from score");
			rs= pstmt.executeQuery();
			if(rs.next()){
				listmembers= new ArrayList<ScoreDataBean>();
				do{
				
					ScoreDataBean listmember = new ScoreDataBean();
					listmember.setSc_list(rs.getInt("sc_list"));
					listmember.setSc_num(rs.getInt("sc_num"));
					listmember.setSc_content(rs.getString("sc_content"));
					listmember.setSc_plus(rs.getInt("sc_plus"));
					listmember.setSc_minus(rs.getInt("sc_minus"));
					listmember.setSc_date(rs.getString("sc_date"));
					listmembers.add(listmember);
				}while(rs.next());
			}
						
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return listmembers;
	}public List<ScoreDataBean> listScore_search(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ScoreDataBean> listmembers= null ;
		
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select * from score where sc_num=?");
			pstmt.setInt(1,num);
			rs= pstmt.executeQuery();
			if(rs.next()){
				listmembers= new ArrayList<ScoreDataBean>();
				do{
				
					ScoreDataBean listmember = new ScoreDataBean();
					listmember.setSc_list(rs.getInt("sc_list"));
					listmember.setSc_num(rs.getInt("sc_num"));
					listmember.setSc_content(rs.getString("sc_content"));
					listmember.setSc_plus(rs.getInt("sc_plus"));
					listmember.setSc_minus(rs.getInt("sc_minus"));
					listmember.setSc_date(rs.getString("sc_date"));
					listmembers.add(listmember);
				}while(rs.next());
			}
						
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return listmembers;
	}
			 
	public StudentDataBean searchStudent(String id) 
				throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentDataBean searchmember=null;
		
		try{
			conn = getConnection();
			            
			pstmt = conn.prepareStatement(
			    "select * from STUDENT where stu_num = ?");
			pstmt.setInt(1, Integer.parseInt(id));
			rs= pstmt.executeQuery();

			if(rs.next()){
				searchmember = new StudentDataBean();
				searchmember.setStu_num(rs.getInt("stu_num"));
				searchmember.setStu_name(rs.getString("stu_name"));
				searchmember.setStu_total(rs.getInt("stu_total"));
				searchmember.setStu_pw(rs.getInt("stu_pw"));
			}
						
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally{
			if (rs != null) 
				try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) 
				try { pstmt.close(); } catch(SQLException ex) {}
			if (conn != null) 
				try { conn.close(); } catch(SQLException ex) {}
		}
		return searchmember;
	}
	public StudentDataBean searchScore(String id) 
			throws Exception {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StudentDataBean searchmember=null;
	
	try{
		conn = getConnection();
		            
		pstmt = conn.prepareStatement(
		    "select * from MEMBERSHIP where id = ?");
		pstmt.setString(1, id);
		rs= pstmt.executeQuery();

		if(rs.next()){
			searchmember = new StudentDataBean();
			searchmember.setStu_num(rs.getInt("stu_num"));
			searchmember.setStu_name(rs.getString("stu_name"));
			searchmember.setStu_total(rs.getInt("stu_total"));
			searchmember.setStu_pw(rs.getInt("stu_pw"));
		}
					
	}catch(Exception ex) {
		ex.printStackTrace();
	}finally{
		if (rs != null) 
			try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) 
			try { pstmt.close(); } catch(SQLException ex) {}
		if (conn != null) 
			try { conn.close(); } catch(SQLException ex) {}
	}
	return searchmember;
}
			
}