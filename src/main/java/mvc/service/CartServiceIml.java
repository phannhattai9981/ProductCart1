package mvc.service;

import mvc.entity.Cart;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class CartServiceIml implements CartService {
    Map<Integer, Cart> map = new HashMap<>();
    @Override
    public void addCart(Cart item) {
        Cart cart = map.get(item.getProduct().getId());
        if(cart == null) {
            map.put(item.getProduct().getId(), item);
        }else {
            cart.setQuantity(item.getQuantity() + 1);
        }

    }

    @Override
    public void removeCart(int id) {
        map.remove(id);
    }

    @Override
    public Cart updateCart(int pid, int quantity) {
        Cart item = map.get(pid);
        item.setQuantity(quantity);
        return item;
    }

    @Override
    public Collection<Cart> getAllCart() {
        return map.values();
    }

    @Override
    public int getCout() {
        return map.values().size();
    }

    @Override
    public double getAmount() {
        return map.values().stream().mapToDouble(item -> item.getQuantity() * item.getProduct().getPrice()).sum();
    }

    @Override
    public void clear() {
    map.clear();
    }
}
