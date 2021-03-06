package office.zszm.action;
import java.util.List;

import office.process.action.GetProcessByPosition;
import office.process.dao.ProcessDAO;
import office.userinfo.dao.UserInfoDAO;
import office.userinfo.pojo.UserInfo;
import office.util.DateUtil;
import office.util.UserUtil;
import office.process.pojo.Process;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.opensymphony.xwork2.ActionContext;

import ccb.hibernate.HibernateSessionFactory;
public class ShowZzzmPageTj {
	private String newnumber;
	private String newnumbers;
	private List<UserInfo> list;
	private UserInfo ui;
	private Integer chu;
	private String position;
    private String time;
    private String sex;
    private String zhiwu;
    private String tel;
    private int isdeparture;
    private String yscjchoose;
    



	public String getNewnumbers() {
		return newnumbers;
	}


	public void setNewnumbers(String newnumbers) {
		this.newnumbers = newnumbers;
	}


	public String getYscjchoose() {
		return yscjchoose;
	}


	public void setYscjchoose(String yscjchoose) {
		this.yscjchoose = yscjchoose;
	}


	public int getIsdeparture() {
		return isdeparture;
	}


	public void setIsdeparture(int isdeparture) {
		this.isdeparture = isdeparture;
	}


	public String getZhiwu() {
		return zhiwu;
	}


	public void setZhiwu(String zhiwu) {
		this.zhiwu = zhiwu;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public List<UserInfo> getList() {
		return list;
	}


	public void setList(List<UserInfo> list) {
		this.list = list;
	}


	public String getNewnumber() {
		return newnumber;
	}


	public void setNewnumber(String newnumber) {
		this.newnumber = newnumber;
	}


	public Integer getChu() {
		return chu;
	}


	public void setChu(Integer chu) {
		this.chu = chu;
	}

	public UserInfo getUi() {
		return ui;
	}


	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}


	public void setUi(UserInfo ui) {
		this.ui = ui;
	}


	public String execute() throws Exception
	{
		Session session = HibernateSessionFactory.getSession();
 	    Transaction trans = session.beginTransaction();
 	    DateUtil du = new DateUtil();
 	    UserInfoDAO uidao = new UserInfoDAO();
 	    GetProcessByPosition gpbp = new GetProcessByPosition();
 	    ProcessDAO pdao = new ProcessDAO();
 	    int process = 0;
 	     	
 	    ui = uidao.findByNewNumber(newnumbers);
 	    position = ui.getPosition();
 	    String thisunder = "";
 	    sex = UserUtil.getSexFromIdentity(ui.getIdentity());
 	    time = du.getDate();
 	    process = gpbp.getZzzmProcess(position);
 	    Process p = pdao.findByItemAndApplicant("ZZZM", process);
 	    ActionContext.getContext().getSession().put("yscjchoose",yscjchoose);
 	    if(p!=null)
	    {
 	    	thisunder = p.getProcess().substring(1, 2);//EDCA
 	    	list = uidao.findByAuthorityAndPosition(thisunder, position);
	    }
 	    chu = Integer.parseInt(position.substring(2,3));
 	    trans.commit();
		session.flush();
		session.clear();
		session.close();
		
		return "success";
	}
}
