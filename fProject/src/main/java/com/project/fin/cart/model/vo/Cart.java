package com.project.fin.cart.model.vo;

import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Cart {
	private String memberId;
	private String storeName;
	private int storeNo;
	private String menuName;
	private int totalPrice;
	private int quantity;
	private String opTitle;
	private String opName;
	
	
	@Override
	public boolean equals(Object obj) {
	    if (this == obj) {
	        return true;
	    }
	    if (obj == null || getClass() != obj.getClass()) {
	        return false;
	    }
	    Cart other = (Cart) obj;
	    return Objects.equals(menuName, other.menuName)
	            && storeNo == other.storeNo
	            && Objects.equals(opTitle, other.opTitle)
	            && Objects.equals(opName, other.opName)
	            && Objects.equals(memberId, other.memberId);
	}
}
