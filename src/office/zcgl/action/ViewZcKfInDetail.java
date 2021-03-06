package office.zcgl.action;
import java.util.List;

import office.leave.dao.LeaveProcessDAO;
import office.leave.pojo.LeaveProcess;
import office.zcgl.dao.StorehouseTemptDAO;
import office.zcgl.pojo.StorehouseTempt;
import office.zcgl.dao.StorehouseInDAO;
import office.zcgl.pojo.StorehouseIn;
import org.hibernate.Session;
import org.hibernate.Transaction;
import ccb.hibernate.HibernateSessionFactory;
public class ViewZcKfInDetail {
	private String number;
	private String newnumber;
	private StorehouseIn ah;
	private List<StorehouseTempt> listtemp;
	//private int count=0;	
	private List<LeaveProcess> listlp;

	
	public List<StorehouseTempt> getListtemp() {
		return listtemp;
	}

	public void setListtemp(List<StorehouseTempt> listtemp) {
		this.listtemp = listtemp;
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

	public StorehouseIn getAh() {
		return ah;
	}

	public void setAh(StorehouseIn ah) {
		this.ah = ah;
	}


	public List<LeaveProcess> getListlp() {
		return listlp;
	}

	public void setListlp(List<LeaveProcess> listlp) {
		this.listlp = listlp;
	}



	//private UserInfo ui;
	public String execute() throws Exception
	{
		StorehouseInDAO ahdao = new StorehouseInDAO();
		LeaveProcessDAO lpdao = new LeaveProcessDAO();
		//UserInfoDAO uidao = new UserInfoDAO();
		StorehouseTemptDAO ahtdao = new StorehouseTemptDAO();
		Session session = HibernateSessionFactory.getSession();
 	    Transaction trans = session.beginTransaction();
 	    
 	    ah= ahdao.findAllByNumber(number);
 	    listtemp = ahtdao.findAllByRukunum(ah.getRukunum());
 	    listlp = lpdao.findAllByNumber(number);
 	   // ui = uidao.findByNewNumber(ah.getInitiator());
		//position = ui.getPosition();
 	    //bu =wp.getNumber().substring(13, 14);
 	    //count=listap.size();
 	    
 	   
 	    trans.commit();
		session.flush();
		session.clear();
		session.close();
		return "success";
	}
}
