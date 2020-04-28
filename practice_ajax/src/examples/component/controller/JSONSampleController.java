package examples.component.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import examples.entity.ProductModel;

@Controller
public class JSONSampleController {

	public JSONSampleController() { super(); }

	@RequestMapping(value="/json_model.do", method={RequestMethod.POST, RequestMethod.GET}, produces="application/json;charset=UTF-8")
	@ResponseBody
	public ProductModel writeModel(){
		ProductModel productModel = new ProductModel();
			productModel.setId("car");
			productModel.setName("motorcar");
			productModel.setPrice(1000000);
		return productModel;
	}

	@RequestMapping(value="/json_list.do", method={RequestMethod.POST, RequestMethod.GET}, produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<ProductModel> writeModels(){
		List<ProductModel> list = new ArrayList<ProductModel>();
			ProductModel pm1 = new ProductModel();
			pm1.setId("car");
			pm1.setName("motorcar");
			pm1.setPrice(1000000);
			list.add(pm1);

			ProductModel pm2 = new ProductModel();
			pm2.setId("truck");
			pm2.setName("truck(5t)");
			pm2.setPrice(5000000);
			list.add(pm2);
		return list;
	}
}
