package office.zcgl.action;
import java.util.List;
import office.leave.dao.LeaveProcessDAO;
import office.leave.pojo.LeaveProcess;
import office.log.dao.OperateLogDAO;
import office.log.pojo.OperateLog;
import office.process.action.GetProcessByPosition;
import office.process.dao.ProcessDAO;
import office.userinfo.dao.UserInfoDAO;
import office.userinfo.pojo.UserInfo;
import office.util.DateUtil;
import office.util.FileReadAndWrite;
import office.util.Util;
import office.process.pojo.Process;
import office.zcgl.dao.AssetApplyDAO;
import office.zcgl.dao.AssetTempDAO;
import office.zcgl.pojo.AssetApply;
import office.zcgl.pojo.AssetTemp;
import office.zcgl.dao.AssetReturnDAO;
import office.zcgl.pojo.AssetReturn;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import office.zcgl.dao.AssetInfoDAO;
import office.zcgl.pojo.AssetInfo;
import ccb.hibernate.HibernateSessionFactory;
public class UpdateZcReturnStatus {
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
		String result = "success";
		//Timestamp time = new Timestamp(System.currentTimeMillis()); 
		Session session = HibernateSessionFactory.getSession();
 	    Transaction trans=session.beginTransaction();
 	    AssetReturnDAO aydao = new AssetReturnDAO();
 	    LeaveProcessDAO lprodao = new LeaveProcessDAO();
		LeaveProcess lpro = new LeaveProcess();
		OperateLogDAO oldao = new OperateLogDAO();//记录日志
		OperateLog ol = new OperateLog();
		DateUtil du = new DateUtil();
		UserInfoDAO uidao = new UserInfoDAO();
		String time = du.getSimpleDateTime();
		AssetReturn ay = aydao.findAllByNumber(number);
		String jindu = ay.getJindu();
		int jdlength = ay.getJindu().length();//F//FE
		int status = ay.getStatus();
		
		UserInfo ui = uidao.findByNewNumber(newnumber);
		
		ol.setItem("ZCGH");
		ol.setName(ui.getUsername());
		ol.setNewnumber(ay.getPreunder());
		ol.setTime(du.getDateTime());
		ol.setRemark(number);
			
		lpro.setNumber(number);
		lpro.setTime(time);
		lpro.setViewer(ui.getUsername());
		lpro.setViewernewnumber(ay.getPreunder());
		lpro.setAuthority(jindu.substring(jdlength-1, jdlength));
		
		lpro.setRemark("收回承办，重新办理");
		ol.setOperate("收回承办，重新办理");
		
		ay.setThisunder(ay.getPreunder());
		ay.setPreunder(null);
		
		if(jdlength>=2)
			ay.setJindu(jindu.substring(0, jdlength-1));
		else
			ay.setJindu("");
		if(status==4)
		{
			ay.setStatus(1);
		}
		/*else if(status==3)
		{
			tz.setStatus(2);
			//tzdao.unSubmitWcggPage(number);
		}*/
		else if(status==1)
		{
			ay.setStatus(0);
			ay.setThisunder(null);
		}
		message = "收回成功";
		result = "success";
		oldao.merge(ol);
	
		aydao.merge(ay);
		trans.commit();
		session.flush();
		session.clear();
		session.close();
		return result;
	}
}
