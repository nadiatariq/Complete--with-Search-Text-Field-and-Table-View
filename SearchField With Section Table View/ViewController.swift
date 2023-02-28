//
//  ViewController.swift
//  SearchField With Section Table View
//
//  Created by Nadia on 23/02/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var classData = [
        ChildrenClass(className: "Class A", StudentList: ["ALi","Amir","Hania","Nadia","Caio","Mike","Halim"]),
        ChildrenClass(className: "Class B", StudentList: ["ALi","Hamid","meerab","Nadia","Caio","Mike","Halim"]),
        ChildrenClass(className: "Class C", StudentList: ["ALi","Ayan","meerab","Nadia","Caio","Mike","Halim"]),
        ChildrenClass(className: "Class D", StudentList: ["ALi","Haris","Hania","Nadia","Caio","Mike","Halim"])]
    var emptyArray = [ChildrenClass]()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emptyArray = classData
        tableView.reloadData()
        // Do any additional setup after loading the view.
        //        print(classData.filter({$0.StudentList.contains("Hania")}).count)
    }
    
    @IBAction func searchFieldAction(_ sender: UITextField) {
        
        //
        //                        if let searchText = sender.text{
        //
        //                            emptyArray = searchText.isEmpty ? classData :
        //                            classData.filter({$0.StudentList.description.lowercased().contains(searchText.lowercased())})
        //
        //
        //                            }
        //        //            classData.filter{$0.className.lowercased().contains(searchText.lowercased())}
        //
        //
        //                            tableView.reloadData()
        //                        }
        
        self.emptyArray.removeAll()
        let searchTextField = sender
        if searchTextField.text == "" {
            self.emptyArray     = self.classData
            self.tableView.reloadData()
            return
        }
        
    
//        for obj  in self.classData {
//
//            if (obj.StudentList).description.range(of: searchTextField.text!, options: String.CompareOptions.caseInsensitive, range: nil, locale: nil) != nil {
//                self.emptyArray.append(obj)
//            }
//        }
        
        for obj in self.classData{
            var filteredArray  = [String]()
            obj.StudentList.forEach { students in
                if (students.description.lowercased() ).range(of: searchTextField.text!, options: String.CompareOptions.caseInsensitive, range: nil, locale: nil) != nil {
                    filteredArray.append(students)
                }
            }
            
            let getNewObj = ChildrenClass(className: obj.className, StudentList: filteredArray)
            if getNewObj.StudentList.count > 0{
                self.emptyArray.append(getNewObj)
            } 
        
            
        }
        tableView.reloadData()
    }
}
    extension ViewController: UITableViewDelegate, UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return emptyArray.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        emptyArray[section].className
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emptyArray[section].StudentList.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.studentName.text = emptyArray[indexPath.section].StudentList[indexPath.row]
        
        return cell
    }
//    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        view.tintColor = .lightGray
//    }
//
    
}


