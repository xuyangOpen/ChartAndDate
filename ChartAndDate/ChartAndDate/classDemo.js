//添加一个source数组的成员变量，类型为[Person]()的数组，点击cell时，调用pet的方法
require('NSString,UIAlertController,UIAlertAction')
defineClass("ChartAndDate.ViewController",['source'],{
        addNewMethod:function(){
//            self.super().init();
//            require('ChartAndDate.Person,ChartAndDate.Pet');
            //添加第一个Person
            var person = require('ChartAndDate.Person').alloc().init();
            person.setName("李铭")
            var dog = require('ChartAndDate.Pet').alloc().init();
            dog.setPetName("金毛")
            person.setPet(dog);
            //添加第二个Person
//            require('Person')
            var person2 = require('ChartAndDate.Person').alloc().init();
            person2.setName("张桦");
            var dog2 = require('ChartAndDate.Pet').alloc().init();
            dog2.setPetName("德牧");
            person2.setPet(dog2);
            //给数组赋值
            self.setSource([person,person2]);
            //注意：在js中创建的数组，长度用length  ，count()无效
            console.log("数组长度=",self.source().length);
            return self;
        },
        viewDidLoad:function(){
            self.super().viewDidLoad();
            self.view().setBackgroundColor(require('UIColor').whiteColor());
            
            self.myTableView().setDelegate(self);
            self.myTableView().setDataSource(self);
            self.myTableView().setFrame({x:0,y:20,width:self.view().bounds().width,height:self.view().bounds().height-20});
            self.view().addSubview(self.myTableView());

            self.addNewMethod();
        },
        tableView_numberOfRowsInSection:function(tableView,section){
            return self.source().length;
        },
        tableView_cellForRowAtIndexPath:function(tableView,indexPath){
            var cell = tableView.dequeueReusableCellWithIdentifier("identifier");
            if (!cell){
            //注意：纯swift类，使用时，写法：require('ChartAndDate.PersonTableViewCell')
            //强调：纯swift类，即使用 require('ChartAndDate.PersonTableViewCell')声明后，再用类名初始化也不行，必须像下面这样声明初始化👇
                cell = require('ChartAndDate.PersonTableViewCell').alloc().initWithStyle_reuseIdentifier(3,"identifier");
            }
            //注意：js数组取值 ：数组名()[下标]   ，数组名().objectAtIndex(下标)是OC数组取值
            cell.setValuesForLabelWithPerson(self.source()[indexPath.row()]);
            cell.setSelectionStyle(0);
            var weakSelf = __weak(self) //__strong(self)
            //注意：这里的参数类型，如果是类，则要加*号，否则person表示地址，*person才表示取值
            //块为属性时，也需要用set方法
            cell.setTalk(block("ChartAndDate.Person *",function(person){
                    var talkContetn = NSString.stringWithFormat("%@对%@说：你好！",person.name(),person.pet().petName());
                    //弹框提示
                    var alert = UIAlertController.alertControllerWithTitle_message_preferredStyle("提示",talkContetn,1);
                    var action = UIAlertAction.actionWithTitle_style_handler("好",2,null);
                    alert.addAction(action);
                    weakSelf.presentViewController_animated_completion(alert,true,null);
            }))
            
            return cell;
        }
        
            
            
            
})

