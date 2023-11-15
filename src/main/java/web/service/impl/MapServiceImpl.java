package web.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.face.MapDao;
import web.dto.Board;
import web.service.face.MapService;

@Service
public class MapServiceImpl implements MapService {

	@Autowired private MapDao mapDao;
	
	@Override
	public List<List<Board>> list() {
		
		List<Board> Boards =  mapDao.selectAllBoard();
		
        // 중복된 address를 키로 하는 맵 생성
        Map<String, List<Board>> map = new HashMap<>();
        for (Board Board : Boards) {
            String address = Board.getLocation();
            if (!map.containsKey(address)) {
                map.put(address, new ArrayList<>());
            }
            map.get(address).add(Board);
        }
        
        // 맵을 2차원 배열로 변환
        List<List<Board>> result = new ArrayList<>(map.values());
        
        // 출력
        for (List<Board> group : result) {
            for (Board board : group) {
                System.out.println(board.getLocation() + " | " + board.getTitle() + " | " + board.getWriterNick() + " | " + board.getPrice());
            }
            System.out.println("-----");
        }

		return result;
	}
	

	
}