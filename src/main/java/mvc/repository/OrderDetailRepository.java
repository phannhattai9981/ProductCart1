package mvc.repository;

import mvc.entity.OrderDetails;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrderDetailRepository extends CrudRepository<OrderDetails, Integer> {
    @Query(value = "select * from orderdetails where orderid = ?1", nativeQuery = true)
    List<OrderDetails> getOrderDetailByOrderId(int id);
}
