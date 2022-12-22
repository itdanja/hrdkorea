package lab.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lab.service.ProductService;
import lab.service.ProductVO;
import lab.service.SearchVO;

@Controller
public class ProductController {
	
	@Autowired
	ProductService proService;

	@RequestMapping(value="/register.do",method=RequestMethod.GET)
	public String productForm(ModelMap model) throws Exception {
		model.addAttribute("productInfo", new ProductVO());		//화면을 전환 시 Register에 productInfo를 던져줄 건데 담을 그릇을 미리 만들어서 화면에 던져줌
		return "product/productRegister";
	}
	
	//상품 등록
	@RequestMapping(value="/register.do",method=RequestMethod.POST)
	//화면에서는 사용자에게 입력받은 정보를 ProductVO 형태로 넘겨줄 거고@ModelAttribute로 잡을 거임
	//그리고 던져줄 때는 productInfo라는 아이디로 던져줄거임
	public String productRegister(@ModelAttribute("productInfo") ProductVO vo, ModelMap model) throws Exception{
		System.out.println("ID:"+vo.getId());
		System.out.println("NAME:"+vo.getName());
		System.out.println("Price:"+vo.getPrice());
		System.out.println("Type:"+vo.getType());
		System.out.println("Manufacturer:"+vo.getManufacturer());
		
		//테스트로 출력해보고 정상이면 서비스를 호출하고 결과를 반환
		int result = proService.insertProduct(vo);
		
		if(result>0) {		//만약 insert에 성공했다면
			model.addAttribute("id", vo.getId());	//이름을 반환해서 웰컴 메시지 반환
			model.addAttribute("name", vo.getName());
			model.addAttribute("price", vo.getPrice());
			model.addAttribute("type", vo.getType());
			model.addAttribute("manufacturer", vo.getManufacturer());
			return "product/productConfirm";			//product 폴더 안에 있는 productConfirm으로 전환해라
		}else {
			throw new Exception("Wrong Data!");
		}
	}
	
	//상품 목록 보기
	@RequestMapping(value="/productList.do")
	public ModelAndView productList() throws Exception{
		//모든 데이터를 조건 없이 조회해서 반환하도록 null로 지정
		//List<ProductVO>로 받아옴
		List<ProductVO> result = proService.selectProductList(null);
		ModelAndView mav = new ModelAndView();
		//데이터를 넘겨줄 모델 productlist
		mav.addObject("productlist", result);
		//전환해야될 화면의 이름 넘겨줌 - product 폴더 밑에 productList.jsp 사용해라
		mav.setViewName("product/productList");
		return mav;
	}
	
	//상품 상세 보기
	@RequestMapping(value="/productInfo.do")
	//상세 조회를 하기 위해 필요한 pkid를 id로 받아오고
	public String productInfo(@RequestParam("pkid") String id, ModelMap model) throws Exception{
		ProductVO setvo = new ProductVO();
		setvo.setId(id);		//넘어온 id 값을 setvo로 저장
		ProductVO resultvo = proService.selectProduct(setvo);		//selectProduct에 setvo 넘겨주면 데이터가 넘어올 건데 그걸 resultvo에 저장
		model.addAttribute("productinfo", resultvo);
		return "product/productInfo";
	}
	
	//상품 정보 수정
	@RequestMapping(value="/productUpdate.do", method=RequestMethod.GET)
	public String productUpdateForm(@RequestParam("pkid") String id, ModelMap model) throws Exception{
		ProductVO setvo = new ProductVO();
		setvo.setId(id);		//넘어온 id 값을 setvo로 저장
		
		ProductVO resultvo = proService.selectProduct(setvo);
		model.addAttribute("productInfo", resultvo);
		return "product/productUpdate";
	}
	
	@RequestMapping(value="/productUpdate.do", method=RequestMethod.POST)
	public String productUpdateProcess(@ModelAttribute("productInfo") ProductVO vo, ModelMap model) throws Exception{
		System.out.println("ID:"+vo.getId());
		System.out.println("NAME:"+vo.getName());
		System.out.println("Price:"+vo.getPrice());
		System.out.println("Type:"+vo.getType());
		System.out.println("Manufacturer:"+vo.getManufacturer());
		
		proService.updateProduct(vo);
		//productList.do로 보내줘
		return "forward:/productList.do";
	}
	
	//상품 정보 삭제
	@RequestMapping(value="/productDelete.do")
	public String productDelete(@RequestParam("pkid") String id) throws Exception{
		ProductVO setvo = new ProductVO();
		setvo.setId(id);
		
		proService.deleteProduct(setvo);
		return "forward:/productList.do";		//delete 끝나면 list를 볼 수 있는 화면으로 넘어가서 확인해 볼 수 있도록
	}
	
	//상품 검색
	@RequestMapping(value="/searchProduct.do", method=RequestMethod.GET)
	public String searchForm(@RequestParam(required=false, defaultValue="id") String searchType,
							@RequestParam(required=false) String keyword,
							ModelMap model) throws Exception{
		SearchVO setvo = new SearchVO();
		setvo.setSearchType(searchType);		//넘어온 searchType 값을 setvo로 저장
		setvo.setKeyword(keyword);				//넘어온 keyword 값을 setvo로 저장
		
		model.addAttribute("searchingList", proService.searchProductList(setvo));
		return "product/productSearch";
	}
	
}
