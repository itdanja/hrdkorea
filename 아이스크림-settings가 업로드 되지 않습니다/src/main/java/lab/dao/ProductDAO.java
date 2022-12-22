package lab.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import lab.service.ProductVO;
import lab.service.SearchVO;

@Repository("productDAO")
public class ProductDAO extends EgovAbstractMapper{
	//insert
	public int insertProduct(ProductVO vo){
		//insert() 메소드는 EgovAbstractMapper에서 제공하는 메소드임!
		return insert("Product.insertPro", vo);
	}
    	
	//delete
	public int deleteProduct(ProductVO vo){
		return delete("Product.deletePro", vo);
	}
	
	//update
	public int updateProduct (ProductVO vo){
		return update("Product.updatePro", vo);
	}
		
	//select
	//List는 java.util import!!!
	public List<ProductVO> selectProList(ProductVO vo){
		return selectList("Product.selectProList", vo);
	}
	
	//단일 select
	public ProductVO selectProduct(ProductVO vo){
		return selectOne("Product.selectPro",vo);
	}

	//상품 검색
	public List<ProductVO> searchProductList(SearchVO vo){
		return selectList("Product.searchProductList", vo);
	}
}
