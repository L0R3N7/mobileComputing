//
//  TableViewControllerRest.swift
//  uebenapi
//
//  Created by BHITM09 on 23.01.22.
//

import UIKit

class TableViewControllerRest: UITableViewController {

    var queue = DispatchQueue(label: "Thread")
    var posts = Posts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        queue.async {
            let posts:Posts = self.download()
            DispatchQueue.main.async {
                self.posts = posts
                self.tableView.reloadData()
            }
        }

        
        
    }
    
    func download()-> Posts{
        let posts = Posts()
        let path = "https://jsonplaceholder.typicode.com/posts"
        if let url = URL(string: path){
            if let data = try? Data(contentsOf: url){
                if let obj = try? JSONSerialization.jsonObject(with: data, options: []){
                    if let arr = obj as? [[String:Any]] {
                        for arr in arr{
                            let tempPost = Post()
                            tempPost.title = arr["title"] as? String ?? ""
                            tempPost.title = arr["body"] as? String ?? ""
                            posts.arr.append(tempPost)
                            
                        }
                    }
                }
            }else{
                print("request wasn't succesfull")
        }
        }
        return posts
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPosts", for: indexPath)

        cell.textLabel?.text = posts.arr[indexPath.row].title
        cell.detailTextLabel?.text = posts.arr[indexPath.row].body

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
