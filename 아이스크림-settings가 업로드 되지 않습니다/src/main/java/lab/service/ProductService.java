package lab.service;

import java.util.List;

public interface ProductService {
	public int insertProduct(ProductVO productVO) throws Exception;

	public int deleteProduct(ProductVO productVO) throws Exception;

	public int updateProduct(ProductVO productVO) throws Exception;

	public List<ProductVO> selectProductList(ProductVO productVO) throws Exception;

	//단일 select
	public ProductVO selectProduct(ProductVO setvo) throws Exception;
	
	//상품 검색
	public List<ProductVO> searchProductList(SearchVO searchVO) throws Exception;
}
