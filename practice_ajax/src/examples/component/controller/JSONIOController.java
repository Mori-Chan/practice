package examples.component.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import examples.entity.ProductModel;

@Controller
public class JSONIOController {

	public JSONIOController() {
		super();
	}

	@RequestMapping(value="/request_model.do", method=RequestMethod.POST, consumes=MediaType.APPLICATION_JSON_VALUE, produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> receiveParameterByModel(@RequestBody ProductModel productModel){
		Map<String, Object> map = new HashMap<String, Object>();
			map.put("text_url", "request.url=/request_model.do");
			map.put("text_id", "request.id=" + productModel.getId());
			map.put("text_name", "request.name=" + productModel.getName());
			map.put("text_price", "request.price=" + String.valueOf(productModel.getPrice()));
		return map;
	}
}
