package vn.iotstar.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import vn.iotstar.entity.UserInfo;
import vn.iotstar.repository.UserInfoRepository;

import java.util.Optional;

@Service
public class UserService {

    private final UserInfoRepository repository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserInfoRepository repository, PasswordEncoder passwordEncoder) {
        this.repository = repository;
        this.passwordEncoder = passwordEncoder;
    }

    public String addUser(UserInfo userInfo) {
        Optional<UserInfo> existing = repository.findByName(userInfo.getName());
        if (existing.isPresent()) {
            UserInfo u = existing.get();
            u.setPassword(passwordEncoder.encode(userInfo.getPassword()));
            u.setEmail(userInfo.getEmail());
            u.setRoles(userInfo.getRoles());
            repository.save(u);
            return "Cập nhật user thành công!";
        }
        userInfo.setPassword(passwordEncoder.encode(userInfo.getPassword()));
        repository.save(userInfo);
        return "Thêm user thành công!";
    }
}
