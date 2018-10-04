//
//  ListViewController.swift
//  claire
//
//  Created by 김태현 on 2018. 9. 13..
//  Copyright © 2018년 김태현. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    


  //튜플 아이템을 가진 배열로 정의된 데이터 세트
    var dataset = [
    ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다", "2008-09-04", 9.2),
    ("호우시절", "때를 알고 내리는 좋은 비", "2009-10-08", 8.9),
    ("말할 수 없는 비밀","여기서 너까지 다섯 걸음", "2015-05-07", 10.9) ]
    
  // 테이블 뷰를 구성할 리스트 데이터
    
        lazy var list : [MovieVO] = {
        var datalist = [MovieVO]()
        
            for (title, desc, opendate, rating) in self.dataset {
                let mvo = MovieVO()
                
                mvo.title = title
                mvo.description = desc
                mvo.opendate = opendate
                mvo.rating = rating
                
                datalist.append(mvo)
            }
            
            return datalist
    }()
        /*for (title, desc, opendate, rating) in self.dataset {
            let mvo = MovieVO()
            
            mvo.title = title
            mvo.description = description
            mvo.opendate = opendate
            mvo.rating = rating
            
            
            datalist.append(mvo)
        }
            return datalist
        
        
        }()
    */
    override func viewDidLoad() {
        // 전부 삭제 처리
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
        
}
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        
        //let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        
        
        let title = cell.viewWithTag(101) as? UILabel
        
        //-->추가되는 부분 시작
        // 영화제목이 표시될 레이블을 title 변수로 받음
        
        let desc = cell.viewWithTag(102) as? UILabel
        // 영화요약이 표시될 레이블을 desc 변수로 받음
        
        let opendate = cell.viewWithTag(103) as? UILabel
        // 영화 개봉일이 표시될 레이블을 opendate 변수로 받음
        
        let rating = cell.viewWithTag(104) as? UILabel
        //영화 별점이 표시될 레이블을 rating  변수로 받음
        
        title?.text = row.title
        desc?.text = row.description
        opendate?.text = row.opendate
        rating?.text = "\(row.rating!)"
        //<----추가되는 부분 끝
        
        
        
        // cell.textLabel?.text = row.title
        
        //추가사항 : 서브타이틀에 데이터 연결
       // cell.detailTextLabel?.text = row.description
        
        return cell
        
}

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("선택된 행은 \(indexPath.row) 번째행입니다")
}
}
