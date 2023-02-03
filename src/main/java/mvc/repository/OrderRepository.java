package mvc.repository;

import mvc.entity.Orders;
import org.springframework.data.repository.CrudRepository;

public interface OrderRepository extends CrudRepository<Orders, Integer> {
    Orders findByCustomerNameAndCustomerAddress(String customerName, String customerAddress);
}
