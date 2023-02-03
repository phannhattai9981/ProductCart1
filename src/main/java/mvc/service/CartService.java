package mvc.service;

import mvc.entity.Cart;
import org.springframework.stereotype.Service;

import java.util.Collection;
@Service
public interface CartService {
    public void addCart(Cart item);
    public void removeCart(int id);
    Cart updateCart(int id,int quantity);
    Collection<Cart> getAllCart();
    int getCout();
    double getAmount();
    void clear();

}
