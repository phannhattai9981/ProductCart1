package mvc.controller;

import mvc.entity.Product;
import mvc.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/")
public class ProductController {
    @Autowired
    ProductRepository productRepository;

    @RequestMapping(method = GET)
    public String showProducts(Model model) {
        List<Product> productList = (List<Product>) productRepository.findAll();
        model.addAttribute("productList", productList);
        return "product";
    }

    @RequestMapping(value = "/index", method = GET)
    public String index() {
        return "product";
    }
    @RequestMapping(value = "/newProducts", method = POST, produces = "text/plain;charset=UTF-8")
    public String saveProducts(Product product) {
        productRepository.save(product);
        System.out.println("Add Product Success");
        return "redirect:/";
    }

    @RequestMapping(value = "/delete/{id}", method = GET)
    public String deleteProduct(@PathVariable int id) {
        productRepository.deleteById(id);
        return "redirect:/";
    }

    @RequestMapping(value = "/edit/updateProduct/{id}", method = RequestMethod.POST)
    public String updateProduct(Model model, @PathVariable int id,
                                @RequestParam("newName") String name,
                                @RequestParam("newPrice") double price) {
        Product product = productRepository.findById(id).get();
        product.setName(name);
        product.setPrice(price);
        productRepository.save(product);
        return "redirect:/";
    }
}
