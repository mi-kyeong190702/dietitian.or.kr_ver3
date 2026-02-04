package kda.work.business;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import kda.utils.KdaStringUtil;
import kda.work.business.clinic.ClinicService;
import kda.work.business.clinic.data.KB_C_OBECITY;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.expression.spel.CodeFlow.ClinitAdder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BusinessController 
{
	// TO DO : 디렉토리 확인
	private static final String FILE_BASE = "/assets/ver2/download/118/";
	private static final String FILE_LIST_TXT = FILE_BASE + "filelist.txt";
	
	private Log log = LogFactory.getLog(BusinessController.class);
	
	private String tiles = "tiles/work/business/";
	
	@Autowired 
	private ServletContext servletContext;
	
	@Autowired
	ClinicService clinicService;
	
	@RequestMapping(value="kb_c_habits_diagnosis")
	public String kb_c_habits_diagnosis( Model model ) throws Exception
	{	
		log.info("================================ BusinessController [kb_c_habits_diagnosis]");
		
		// -- kb_c_habits_diagnosis service 
		model.addAttribute("list", clinicService.select());
		return tiles + "kb_c_habits_diagnosis";
	}
	
	@RequestMapping("work/business/kb_c_info118.do")
	public String kbCInfo118(@RequestParam (required=false, defaultValue="") String findword,
			@RequestParam (required=false, defaultValue="") String hword,
			@RequestParam ( required=false, defaultValue = "") String act,
			Model model) 
			throws Exception {
		List fileList = new ArrayList();;
		if( !KdaStringUtil.isEmpty(findword) || !KdaStringUtil.isEmpty(hword) ) {
			String filePath = servletContext.getRealPath(FILE_LIST_TXT);
			
			if(filePath.indexOf("../") >=0){
				return tiles + "kb_c_info118";
			}
			BufferedReader br = new BufferedReader(new FileReader(filePath));
		    try {
		        StringBuilder sb = new StringBuilder();
		        String line = null;
		        while (( line = br.readLine() ) != null) {
		            if( line != null ) {
		            	String[] html = line.split("#");
		            	if( html.length == 2 ) {
			            	if( act.equals("P") ) {
			            		if( "All".equals(hword) ) {
			            			fileList.add( convertMap(html[1]));
			            		}  else if( "A-Z".equals(hword) ) {
			            			int ascNum = html[0].charAt(0);
			            			System.out.println( html[0].charAt(0) + "|" + ascNum);
			            			if( ascNum >= 65 && ascNum <= 90 ) {
			            				fileList.add( convertMap(html[1]));
			            			}
			            		}	else if( html[0].equals(hword) )  {
			            			fileList.add( convertMap(html[1]));
			            		}
			            	} else {
			            		if( line.contains(findword) ) 
			            			fileList.add( convertMap(html[1]));
			            	}
		            	}
		            }
		        }
		    } finally{
		        br.close();
		    }
		} 
		
		model.addAttribute("FILE_BASE", FILE_BASE);
		model.addAttribute("fileList", fileList);
		return tiles + "kb_c_info118";
	}
	
	/**
	 * 비만도 평가
	 * 이전 Page : sub5_13_01.asp
	 * 
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping("/work/business/kb_c_obesity_adult.do")
	public String kbCObesityAdult(HttpSession session, Model model) throws Exception {
		List<Map> bodList =  clinicService.getBodM();
		List<Map> actList =  clinicService.getActM();
		
		model.addAttribute("bodList", bodList);
		model.addAttribute("actList", actList);
		
		return "tiles/work/business/kb_c_obesity_adult";
	}
	
	
	@RequestMapping("/work/business/kb_c_obesity_adult_result.do")
	public String kbCObesityAdultResult(KB_C_OBECITY audit, Model model) throws Exception {
	
		audit.convertForm();
		
		double lp_weight = 0;
		double ll_weight = 0;
		
		// 비만도 체크
		if( audit.getGubun() == 1) {
			if(  audit.getSex() == 2 )
				lp_weight = ( audit.getFhit() * audit.getFhit() * 21 ) / 10000 ;
			else
				lp_weight = ( audit.getFhit() * audit.getFhit() * 22 ) / 10000 ;
			lp_weight = Math.round(lp_weight * 10)/10.0;
		}  else {
			Map wtMap = clinicService.getStandardWt(Integer.toString(audit.getSex()), audit.getFhit());
			lp_weight = Double.parseDouble(wtMap.get("standard_wt").toString());
		}

		ll_weight = Math.round( ( audit.getFwit() / lp_weight ) * 100);
		int body = audit.getBody();
		String ls_weight = "";
		if ( body == 2 || body == 3  ) {
			ls_weight = "- 정상체중의 여성의 경우 임신기간 중에서 11-16kg의 체중증가가 적절하다고 알려져 있고, 임신전 체중이 비만한";
			ls_weight += "편이었다며 체중증가량은 7-11kg정도가 바람직합니다. 보통 임산부들의 체중 변화는 임신초기에는 1-2kg 정도이";
			ls_weight += "며 임신중기를 지나면 체중은 보다 빠른 속도로 늘게되어, 1주일에 약 0.3-0.5kg정도입니다. 일반적으로 과체중 또는 ";
			ls_weight += "비만한 임산부는 임신성 고혈압 및 전자간증(고혈압과 부종이 발생)과 같은 산과적 문제의 발생가능성이 높으므로 ";
			ls_weight += "체중의 변화를 정기적으로 점검하면서 체중증가량에 대하여 의사와 상의하도록 하십시오.";
		} else {
			Map resultObe = clinicService.getObeM( audit.getGubun(), ll_weight );
			
			if( resultObe == null ) {
				ls_weight = "죄송합니다. 협회자료에는 현재 맞는 모형이 없습니다.";
			} else {
				if( Integer.parseInt(resultObe.get("obe_seqno").toString()) == 0 ) {
					ls_weight = resultObe.get("obe_desc") + " 단음식이나 기름진 음식을 피하고 저녁 늦게 먹는 식습관, 빨리 식사하는 것 등을 교정해나가는 것이 좋습니다.";
				} else {
					ls_weight = (String)resultObe.get("obe_desc");
				}
			}
		}
		
		// 허리엉덩이둘레비 검사
		String ls_whr = "";
		String lss_whr = "";
		double ll_whr =  0;
		if( audit.getHeap() == 0  && audit.getWaist() == 0 ) {
			ls_whr = "죄송합니다. 허리와 엉덩이 둘레를 입력하지 않으셔서 결과를 볼수가 없습니다";
		} else {
			if( audit.getWaist() > 0  &&  audit.getHeap() == 0 ) {
				Map resultWhr = clinicService.getWhrM("2", audit.getWaist());
				ls_whr = (String)resultWhr.get("comment");
			} else {
				ll_whr = audit.getWaist() / audit.getHeap(); // round 2
				if( ll_whr < 1 ) {
					lss_whr = KdaStringUtil.lpad(ll_whr, 2);
				}
				Map resultWhr = clinicService.getWhrM("1", ll_whr);
				ls_whr = (String)resultWhr.get("comment");
			}
 		} 
		audit.setLp_weight(lp_weight);
		audit.setLl_weight(ll_weight);
		audit.setLs_weight(ls_weight);
		audit.setLl_whr(ll_whr);
		audit.setLs_whr(ls_whr);
		audit.setLss_whr(lss_whr);
		
		// 체지방
		String ls_fat = "";
		if( audit.getFat() == 0 ) {
			ls_fat =  "죄송합니다. 체지방을 입력하지 않으셔서 결과를 볼수가 없습니다.";
		} else {
			Map resultFat = clinicService.getGreM(audit.getFatGubun(), audit.getSex(), audit.getFat());
			ls_fat = (String)resultFat.get("gre_desc");
		}
		audit.setLs_fat(ls_fat);
		
		// 혈압 코드
		String ls_blood = "";
		if( audit.getBloodph() == 0 || audit.getBloodpl() ==0 ){
			ls_blood = "죄송합니다. 혈압을 입력하지 않으셔서 결과를 볼수가 없습니다.";
		} else {
			Map resultBloodph = null;
			Map resultBloodpl = null;
			if( audit.getBloodGubun() == 1  ) {
				resultBloodph = clinicService.getBlpM(1, audit.getBloodGubun(), audit.getBloodph(), 0 );
				resultBloodpl = clinicService.getBlpM(2, audit.getBloodGubun(), audit.getBloodpl(), 0 );
				
			} else {
				resultBloodph = clinicService.getBlpM(1, audit.getBloodGubun(), audit.getBloodph(), audit.getFage() );
				resultBloodpl = clinicService.getBlpM(2, audit.getBloodGubun(), audit.getBloodpl(), audit.getFage() );
			}
			
			if( resultBloodph == null || resultBloodpl == null ) {
			} else if( resultBloodph == null ) {
				ls_blood = "죄송합니다. 협회자료에는 현재 맞는 혈압자료가 없습니다.";
			} else {
				if( Integer.parseInt(resultBloodph.get("check_value").toString()) >= 
						Integer.parseInt( resultBloodpl.get("check_value").toString()) ) {
					ls_blood = (String)resultBloodph.get("comment");
				} else {
					ls_blood = (String)resultBloodpl.get("comment");
				}
			}
		}
		audit.setLs_blood(ls_blood);
		
		//혈당
		String ls_bloods = "";
		int bloodgbn = 0;
		if( audit.getBloodsa() == 0 && audit.getBloodsb() == 0 ) {
			ls_bloods =  "죄송합니다. 혈당을 입력하지 않으셔서 결과를 볼수가 없습니다.";
		} else if( audit.getBloodsb() == 0  ) {
			if( audit.getBloodsa() <= 60 ) {
				bloodgbn = 1; // 저혈당
			} else if(  audit.getBloodsa() >= 61 && audit.getBloodsa() <= 139 ) {
				bloodgbn = 5; // 정상
			} else if( audit.getBloodsa() >= 140 &&  audit.getBloodsa() <= 199 ) {
				bloodgbn = 3; // 내당능장애
			} else if( audit.getBloodsa() >= 200 ) {
				bloodgbn = 4; // 당뇨병
			} else {
				ls_bloods = "식후혈당이 잘못 입력되었습니다.";
			}
			if( bloodgbn > 0 ) {
				Map bloodMap = clinicService.getBlsM2( Integer.toString( bloodgbn) );
				if( bloodMap != null )
					ls_bloods = (String)bloodMap.get("comment");
			}
		}  else if( audit.getBloodsa() == 0  ) {
			
			if( audit.getBloodsa() <= 60 ) {
				bloodgbn = 1; // 저혈당
			} else if(  audit.getBloodsa() >= 61 && audit.getBloodsa() <= 110 ) {
				bloodgbn = 5; // 정상
			} else if( audit.getBloodsa() >= 111 &&  audit.getBloodsa() <= 125 ) {
				bloodgbn = 2; // 공복혈당장애
			} else if( audit.getBloodsa() >= 126 ) {
				bloodgbn = 4; // 당뇨병
			} else {
				ls_bloods = "공복혈당이 잘못 입력되었습니다.";
			}
				
			if( bloodgbn > 0 ) {
				Map bloodMap = clinicService.getBlsM2( Integer.toString( bloodgbn) );
				if( bloodMap != null ) {
					ls_bloods = (String)bloodMap.get("comment");
				}
			}
			
		} else {
			Map	bloodMap = clinicService.getBlsM(audit.getBloodsa(), audit.getBloodsb());
			if( bloodMap != null ) {
				bloodMap = clinicService.getBlsM2( (String)bloodMap.get("division") );
			}
			
			if( bloodMap != null ) {
				ls_bloods = (String)bloodMap.get("comment");
			}
		}
		audit.setLs_bloods(ls_bloods);
		
		// 기초 대사량
		double l_b_weight = 0;
		double l_basic = 0;
		if( ll_weight >= 90 && ll_weight <= 110 ) {
			l_b_weight = audit.getFwit();
		} else {
			l_b_weight = lp_weight;
		}

		if( audit.getGubun() == 1) {
			if( audit.getSex() == 2 ) {
				l_basic = 655 + ( 9.6 * l_b_weight ) + ( 1.8 * audit.getFhit() ) - ( 4.7 * audit.getFage() );
			} else {
				l_basic = 66.4 + ( 13.7 * l_b_weight ) + ( 5 * audit.getFhit() ) - ( 6.8 * audit.getFage() );
			}
		}
		audit.setL_basic(l_basic);
		
		System.out.println("l_basic : " + l_basic);
		
		// 활동 지수 구하기
		double l_act_index = 0;
		Map actMap = clinicService.getActM(audit.getAction());
		l_act_index = Double.parseDouble(actMap.get("act_index").toString());

		System.out.println("l_act_index : " + l_act_index);
		
		// 에너지 권장량
		double li_ena;
		double l_energy = 0;
		if ( audit.getGubun() == 1 ){ 
			if ( audit.getDisease() == 2 ) {
				if ( audit.getBody() == 2 ) {
					li_ena = 150;
				} else if( audit.getBody() == 3 ) {
					li_ena = 350;
				} else {
					li_ena = 0;
					if ( ll_weight >= 120 ) {
						l_b_weight = lp_weight + ( audit.getFwit() - lp_weight ) * 0.2;
					} else { 
						l_b_weight = lp_weight;
					}
				} 

				if ( audit.getAction() == 1 )
					l_energy = l_b_weight * 25 + li_ena;
				else if ( audit.getAction() == 2) 
		   			l_energy = l_b_weight * 30 + li_ena;
				else if ( audit.getAction() == 3) 
		   			l_energy = l_b_weight * 35 + li_ena;
				else if ( audit.getAction() == 4) 
		   			l_energy = l_b_weight * 40 + li_ena;
				else if ( audit.getAction() == 5) 
		   			l_energy = l_b_weight * 45 + li_ena;
			} else {
				if ( audit.getBody() == 2 )
					li_ena = 150;
				else if ( audit.getBody() == 3 )
					li_ena = 350;
				else if ( audit.getBody() == 4 )
					li_ena = 500;
				else if ( ll_weight >= 120 ) 
					li_ena = ( audit.getFwit() - lp_weight ) * 8.3 - 500;
				else if ( ll_weight < 80 )
					li_ena = 500;
				else 
					li_ena = 0;
				
				l_energy = l_basic + ( l_basic * l_act_index ) + li_ena;
				l_energy = Math.round(l_energy);
			}
		} else {
			Map energyMap = clinicService.getRdaM(audit.getSex(), audit.getFage());
			l_energy = Double.parseDouble(energyMap.get("rda_energy").toString());
				
			if ( ll_weight < 120 ) 
				l_energy = l_energy * audit.getFwit();
			else if ( ll_weight > 140 )
				l_energy = l_energy * lp_weight - 500;
			else
				l_energy = l_energy * lp_weight;
			
			l_energy = Math.round(l_energy);
		}
		audit.setL_energy(l_energy);
		
		// 단백질 권장량
		double li_pro = 0;
		double ll_protein = 0;
		if( audit.getGubun() == 1 ) {
			if ( audit.getBody() == 4 ) 
				li_pro = 20;
			else if ( audit.getBody() == 2 || audit.getBody() == 3 ) 
				li_pro = 15;
			else
				li_pro = 0;
			
			ll_protein = lp_weight * 1.13 + li_pro;
				
		} else {
			if ( audit.getSex() == 2 ){
				if ( audit.getFage() >= 10 && audit.getFage() <= 12 )
					li_pro = 1.54;
				else if ( audit.getFage() >= 13 && audit.getFage() <= 15 )
					li_pro = 1.30;
				else if ( audit.getFage() >= 16 && audit.getFage() <= 19 )
					li_pro = 1.20;
			} else {
				if ( audit.getFage() >= 10 && audit.getFage() <= 12 )
					li_pro = 1.62;
				else if (  audit.getFage() >= 13 && audit.getFage() <= 15 )
					li_pro = 1.40;
				else if(  audit.getFage() >= 16 && audit.getFage() <= 19 )
					li_pro = 1.25;
			}
			
			ll_protein = lp_weight * li_pro;
		}
		
		audit.setLl_protein(ll_protein);
		
		model.addAttribute("result", audit);
		return "tiles/work/business/kb_c_obesity_adult_result";
	}

	@RequestMapping("/work/business/kb_c_obesity_child_result.do")
	public String kbCObesityChildResult(KB_C_OBECITY audit, Model model) throws Exception {
		audit.convertForm();
		/*
		A = " Select standard_wt, general_fr_high, general_to_high, exhort_kcal"
				A = A & " From hwa_tbl "
				A = A & " Where division_sex = '" & Sex & "'"
				A = A & " AND standard_fr_high <= " & Fhit 
				A = A & " AND standard_to_high >= " & Fhit
		*/
		Map wtMap = clinicService.getStandardWt(Integer.toString(audit.getSex()), audit.getFhit());
		
		String resultStr = "";
		double standard = 0.00;
		double standard_p = 0.00;
		double standard_m = 0.00;
		
		double standardwt = 0.00;
		double fatness = 0.00;
		double eKal = 0.00;
		int fatcode = 1;
		if( wtMap == null  ) {
			resultStr = "죄송합니다. 협회자료에는 현재 맞는 모형이 없습니다.";
		} else {
			// 표준체중 계산
			standard = Double.parseDouble(wtMap.get("standard_wt").toString());
			standard_p = standard + (standard * 0.1);
			standard_m = standard - (standard * 0.1);
			
			
			// 열량조회
			Map generalWtMap = clinicService.getGeneralWt(Integer.toString(audit.getSex()), audit.getFage(), audit.getFhit());
			if( generalWtMap != null ) {
				eKal = Double.parseDouble(generalWtMap.get("exhort_kcal").toString());
			} else {
				eKal = Double.parseDouble(wtMap.get("exhort_kcal").toString());
			}
			
			// 비만도 메시지 조회
			standardwt = Double.parseDouble(wtMap.get("standard_wt").toString());
			System.out.println( Math.round(audit.getFwit() / standardwt * 10000) / 100 );
			
			fatness =  Math.round((audit.getFwit()/standardwt) * 10000) / 100.00;
			if( fatness > 160 ) {
				fatcode = 6;
			} else if( fatness <= 160 && fatness > 140 ) {
				fatcode = 5;
			} else if( fatness <= 140 && fatness > 120 ) {
				fatcode = 4;
			}  else if( fatness <= 120 && fatness > 110 ) {
				fatcode = 3;
			}  else if( fatness <= 110 && fatness > 90 ) {
				fatcode = 2;
			}  else {
				fatcode = 1;
			}
					
			Map obeMap =  clinicService.getObeTbl(fatcode);
			resultStr = obeMap.get("obe_desc").toString();
		}
		// 표준체중
		model.addAttribute("standard", standard);
		model.addAttribute("standard_p", standard_p);
		model.addAttribute("standard_m", standard_m);
		// 열량
		model.addAttribute("eKal", eKal);
		// 비만도
		model.addAttribute("fatness", fatness);
		model.addAttribute("result", audit);
		model.addAttribute("resultStr", resultStr);
		
		return  "tiles/work/business/kb_c_obesity_child_result";
	}
	
	
	private Map<String, String> convertMap(String htmlName) {
		String name = htmlName.substring( 0, htmlName.lastIndexOf(".") );
		String url = htmlName;
		Map<String, String> rtnMap = new HashMap<String, String>();
		rtnMap.put("name", name);
		rtnMap.put("html", url);
		return rtnMap;
	} 
	
	
	

}
