package mvc.controller;

import mvc.entity.Orders;
import mvc.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping(value = "/orderlist")
public class OrderController {
    @Autowired
    OrderRepository orderRepository;

    @RequestMapping(method = GET)
    public String showOrders(Model model) {
        model.addAttribute("type", "orders");
        List<Orders> ordersList = (List<Orders>) orderRepository.findAll();
        model.addAttribute("orderList", ordersList);
        return "order";
    }

    @RequestMapping(value = "/newOrder", method = GET)
    public String showNewOrder(Model model) {
        model.addAttribute("order", new Orders());
        model.addAttribute("msg", "Add a new order");
        model.addAttribute("action", "newOrder");
        model.addAttribute("type", "newOrder");
        return "order";
    }

    @RequestMapping(value = "/newOrder", method = POST, produces = "text/plain;charset=UTF-8")
    public String saveOrder(Orders orders) {
        orderRepository.save(orders);
        System.out.println("NewOrder Success");
        return "redirect:/orderlist";
    }

    @RequestMapping(value = "/delete/{id}", method = GET)
    public String deleteProduct(@PathVariable int id) {
        orderRepository.deleteById(id);
        return "redirect:/orderlist";
    }

}

