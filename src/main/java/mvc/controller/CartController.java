package mvc.controller;

import mvc.entity.Cart;
import mvc.entity.Orders;
import mvc.entity.OrderDetails;
import mvc.entity.Product;
import mvc.repository.OrderDetailRepository;
import mvc.repository.OrderRepository;
import mvc.repository.ProductRepository;
import mvc.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/cart")
public class CartController {
    @Autowired
    private CartService cartService;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    @GetMapping()
    public String showCart(Model model){
        double total = cartService.getAmount();
        model.addAttribute("total", total);
        model.addAttribute("type","cart");
        model.addAttribute("cartItem", cartService.getAllCart());
        return "cart";
    }
    @GetMapping(value="/add/{id}")
    public String saveCarts(@PathVariable Integer id) {
        Product product = productRepository.findById(id).get();
        Cart item = new Cart();
        item.setProduct(product);
        item.setQuantity(1);

        cartService.addCart(item);
        System.out.println("Add Cart Success");
        return "redirect:/cart";
    }
    @GetMapping(value="/clear")
    public String clearCart() {
        cartService.clear();
        return "redirect:/cart";
    }
    @GetMapping(value = "/remove/{id}")
    public String delCart(@PathVariable Integer id) {
        cartService.removeCart(id);
        return "redirect:/cart";
    }

    @PostMapping(value = "/update/{id}")
    public String delCart(@PathVariable Integer id,
                          @RequestParam int quantity) {
        cartService.updateCart(id, quantity);
        return "redirect:/cart";
    }

    @GetMapping(value="/checkout")
    public String check(Model model) {
        model.addAttribute("order", new Orders());
        return "checkoutorder";
    }
    @PostMapping(value = "/checkout", produces = "text/plain;charset=UTF-8")
    public String checkOut( Orders orders) {
        Orders order1 = orderRepository.findByCustomerNameAndCustomerAddress(orders.getCustomerName(), orders.getCustomerAddress());
        if (order1 != null) {
            orderRepository.save(order1);
            Collection<Cart> cartItems = cartService.getAllCart();
            for (Cart item : cartItems) {
                OrderDetails orderDetail = new OrderDetails();
                Product product = productRepository.findById(item.getProduct().getId()).get();
                orderDetail.setQuantity(item.getQuantity());
                orderDetail.setOrders(order1);
                orderDetail.setProduct(product);
                orderDetailRepository.save(orderDetail);
            }
        }else {
            orderRepository.save(orders);
            Collection<Cart> cartItems = cartService.getAllCart();
            for (Cart item : cartItems) {
                OrderDetails orderDetail = new OrderDetails();
                Product product = productRepository.findById(item.getProduct().getId()).get();
                orderDetail.setQuantity(item.getQuantity());
                orderDetail.setOrders(orders);
                orderDetail.setProduct(product);
                orderDetailRepository.save(orderDetail);
            }
        }
        cartService.clear();
        return "redirect:/orderlist";
    }
    @GetMapping("/view_orderId={id}")
    public String viewCartOfCustomer(@PathVariable int id, Model model) {
        Orders orders = orderRepository.findById(id).get();
        model.addAttribute("customer", orders);
        List<OrderDetails> orderDetails = orderDetailRepository.getOrderDetailByOrderId(id);
        model.addAttribute("orderDetails", orderDetails);
        return "usercart";
    }

    @GetMapping("/removeOrderDetail{id}")
    public String deleteCart(@PathVariable int id) {
        orderDetailRepository.deleteById(id);
        return "redirect:/orderlist";
    }
}
