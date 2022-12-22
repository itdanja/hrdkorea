package lab.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import lab.dao.ProductDAO;
import lab.service.ProductService;
import lab.service.ProductVO;
import lab.service.SearchVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	//ProductDAO.java의 @Repository이름이 productDAO
	//productDAO를 주입받겠다
	@Resource(name="productDAO")
	ProductDAO dao;
	
	@Override	
	public int insertProduct(ProductVO productVO) throws Exception {
		return dao.insertProduct(productVO);
	}

	@Override	
	public int updateProduct(ProductVO productVO) throws Exception {
		return dao.updateProduct(productVO);
	}
	
	@Override
	public int deleteProduct(ProductVO productVO) throws Exception {
		return dao.deleteProduct(productVO);		
	}

	@Override
	public List<ProductVO> selectProductList(ProductVO productVO) throws Exception {
		return dao.selectProList(productVO);
	}


	@Override
	public ProductVO selectProduct(ProductVO productVO) throws Exception {
		return dao.selectProduct(productVO);
	}

	@Override
	public List<ProductVO> searchProductList(SearchVO searchVO) throws Exception {
		return dao.searchProductList(searchVO);
	}
	
}
