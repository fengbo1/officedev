package office.wcgg.action;

import java.sql.Timestamp;

import office.leave.dao.LeaveProcessDAO;
import office.leave.pojo.LeaveProcess;
import office.log.dao.OperateLogDAO;
import office.log.pojo.OperateLog;
import office.userinfo.dao.UserInfoDAO;
import office.userinfo.pojo.UserInfo;
import office.util.DateUtil;
import office.wcgg.dao.WcggPageDAO;
import office.wcgg.pojo.WcggPage;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ccb.hibernate.HibernateSessionFactory;

public class DeleteWcggPage {

	private String message;
	private String number;
	private String newnumber;
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getNewnumber() {
		return newnumber;
	}
	public void setNewnumber(String newnumber) {
		this.newnumber = newnumber;
	}
	public String execute() throws Exception
	{
		Session session = HibernateSessionFactory.getSession();
 	    Transaction trans=session.beginTransaction();
 	    
		OperateLogDAO oldao = new OperateLogDAO();//记录日志
		OperateLog ol = new OperateLog();
		DateUtil du = new DateUtil();
		WcggPageDAO wpdao = new WcggPageDAO();
		LeaveProcessDAO lprodao = new LeaveProcessDAO();
		LeaveProcess lpro = new LeaveProcess();
		//Timestamp time = new Timestamp(System.currentTimeMillis()); 
		WcggPage wp = wpdao.findAllByNumber(number);
		UserInfoDAO uidao = new UserInfoDAO();
		UserInfo ui = uidao.findByNewNumber(newnumber);
		String time = du.getSimpleDateTime();
		message = "撤销成功";
		
		ol.setItem("WCGG");
		ol.setName(ui.getUsername());
		ol.setNewnumber(newnumber);
		ol.setTime(du.getDateTime());
		ol.setOperate("撤销审批表");
		ol.setRemark(number);
		
		lpro.setAuthority(ui.getAuthority());
		lpro.setNumber(number);
		lpro.setTime(time);
		lpro.setViewer(ui.getUsername());
		lpro.setViewernewnumber(ui.getNewnumber());
		lpro.setRemark("已撤销");
		lpro.setRole("撤销");
		lprodao.merge(lpro);
		oldao.merge(ol);
		
		if(wp.getStatus()==3||wp.getStatus()==4)//如果状态已审批完毕，需反向执行提交操作
		{
			message = wpdao.unSubmitWcggPage(number);
		}
		
//		String sqlwp = "delete from t_wcgg_page where number='"+number+"'";
//		String sqllpro = "delete from t_leave_process where number='"+number+"'";
//		String sqlbd = "delete from t_wcgg_baodao where number='"+number+"'";
//		session.createSQLQuery(sqlwp).executeUpdate();
//		session.createSQLQuery(sqllpro).executeUpdate();
//		session.createSQLQuery(sqlbd).executeUpdate();
		
		wp.setStatus(6);//状态修改为已撤销
		wp.setPreunder("");
		wp.setThisunder("");
 	    trans.commit();
		session.flush();
		session.clear();
		session.close();
		return "success";
	}
}
