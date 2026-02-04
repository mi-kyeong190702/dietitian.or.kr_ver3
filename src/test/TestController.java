package test;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController 
{
	private Log log = LogFactory.getLog(TestController.class);
	
	@Autowired
	SqlSessionFactory sqlSessionFactory1;
	
	@RequestMapping(value="test_transaction" , method = RequestMethod.GET )
	public void doTest( Model model )
	{	
		log.info("test_transaction in >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ");
		
		SqlSession session = sqlSessionFactory1.openSession();
		
		try{
			session.insert("test_insert");
		}
		catch(Exception e) {
			System.out.println("doTest error!" + e.toString());			
		} finally {
			session.close();
		}	
	}
}
