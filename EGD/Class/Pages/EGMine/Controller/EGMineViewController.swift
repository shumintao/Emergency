//
//  EGMineViewController.swift
//  Emergency
//
//  Created by shumin.tao on 2017/5/25.
//  Copyright © 2017年 yidian. All rights reserved.
//

import UIKit
import MJExtension

class EGMineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,EClickHeadViewDelegate {
    
    var EGmineTableView = UITableView.init()
    var EGDataArray = NSArray.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getDataSourceArray()
    }
    
    
    private func setupTableView() {
        EGmineTableView.frame = CGRect.init(x: 0, y: 0, width: kMainBoundsWidth, height: kMainBoundsHeight)
        EGmineTableView.delegate = self
        EGmineTableView.dataSource = self
        EGmineTableView.showsVerticalScrollIndicator = false
        EGmineTableView.showsHorizontalScrollIndicator = false
        EGmineTableView.backgroundColor = UIColor.themeTbaleviewGrayColors()
        EGmineTableView.rowHeight = 60*ScreenScale
        let mineHeadView = EGMineTopView.init(frame: CGRect.init(x: 0, y: 0, width: kMainBoundsWidth, height: 210*ScreenScale))
        mineHeadView.delagate = self
        EGmineTableView.tableHeaderView = mineHeadView
        EGmineTableView.tableFooterView = UIView.init()
        view.addSubview(EGmineTableView)
    }
    
    func getDataSourceArray() {
        let dataArray = [["leftTitle":"设置","className":"EGSettingViewController","iconImage":"设置","iconRightImage":"home_more"],
                         ["leftTitle":"使用帮助","className":"WebViewController","iconImage":"使用帮助","iconRightImage":"home_more"]]
        EGDataArray = EGSettingModel.mj_objectArray(withKeyValuesArray: dataArray)
    }
    
}

//UITableViewDelegate
extension EGMineViewController{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EGDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier:EGMineCellID) as?EGSettingTableViewCell
        if cell == nil {
            cell = EGSettingTableViewCell.init(style: .default, reuseIdentifier: EGMineCellID)
        }
        
        cell?.setting = EGDataArray[indexPath.row] as?EGSettingModel
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        
    }
}

//点击头像代理行为
extension EGMineViewController {
    func clickEGHeadAction(sender: UIButton) {
        EGLog("点击头像")
    }
}




