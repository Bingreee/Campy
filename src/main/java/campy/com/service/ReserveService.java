package campy.com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import campy.com.dao.ReserveDao;

@Service
public class ReserveService {

	@Autowired
	ReserveDao rdao;
}
