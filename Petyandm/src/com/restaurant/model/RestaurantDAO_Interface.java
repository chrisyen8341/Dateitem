package com.restaurant.model;

import java.util.List;

public interface RestaurantDAO_Interface {
	 void add(Restaurant rest);
	 void updateRestForManager(Restaurant rest);
	 void updateRestForRestMember(Restaurant rest);
	 void delete(Integer restNo);
	 Restaurant findByPK(Integer restNo);
	 List<Restaurant> getAll();
}
