package vn.iotstar.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Customer {
    private String id;
    private String name;
    private String phoneNumber;
    private String email;
}
