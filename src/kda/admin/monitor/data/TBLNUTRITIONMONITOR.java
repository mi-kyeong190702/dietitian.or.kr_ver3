package kda.admin.monitor.data;

import kda.spring.abstr.KdaAbstractDto;
import lombok.Data;

import org.springframework.stereotype.Component;


@Component
@Data public class TBLNUTRITIONMONITOR extends KdaAbstractDto{

	private int m_inx;
	private String m_name;
	private String m_post;
	private String m_addr;
	private String m_tel;
	private String indate;
	private String m_element;
	private String mcode;
	private String mid;
	private String s_gubun01_01;
	private String s_text01_01;
	private String s_gubun01_02;
	private String s_text01_02;
	private String s_gubun01_03;
	private String s_text01_03;
	private String s_gubun02_01;
	private String s_text02_01;
	private String s_gubun02_02;
	private String s_text02_02;
	private String s_gubun02_03;
	private String s_text02_03;
	private String s_text03_01;
}
