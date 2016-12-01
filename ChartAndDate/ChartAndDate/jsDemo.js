defineClass("ChartAndDate.ViewController",{
        viewDidLoad:function(){
            self.super().viewDidLoad();
            var newArray = require('NSMutableArray').alloc().init();
            for (var i=0;i<10;i++){
                var str = "第" + (i + 1) + "个JS元素"
//                console.log(typeof str) 打印str类型
                newArray.addObject(str);
            }
            self.setDataSource(newArray);
            self.myTableView().setDelegate(self);
            self.myTableView().setDataSource(self);
            var width = self.view().bounds().width;
            var height = self.view().bounds().height - 20;
            self.myTableView().setFrame({x:0, y:20, width:width, height:height});
            self.view().addSubview(self.myTableView());
            console.log("js脚本替换viewDidLoad方法");
        },
            
        tableView_numberOfRowsInSection:function(tableView,section){
            console.log("js脚本替换numberOfRows方法");
            return self.dataSource().count() - 5;
        },
            
        tableView_cellForRowAtIndexPath:function(tableView,indexPath){
            var cell = tableView.dequeueReusableCellWithIdentifier("identifier");
            if (!cell){
                require('UITableViewCell')
                cell = UITableViewCell.alloc().initWithStyle_reuseIdentifier(0,"identifier");
            }
            cell.textLabel().setText(self.dataSource().objectAtIndex(indexPath.row()));
            
            console.log("js脚本替换cellForRowAtIndexPath方法");
            return cell;
        },
        tableView_didSelectRowAtIndexPath:function(tableView,indexPath){
            console.log("执行JS中的didSelect方法 ," + indexPath.row() + "个数");
        }
            
            
            
        
})
