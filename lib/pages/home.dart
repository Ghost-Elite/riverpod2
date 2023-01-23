import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2/data/user_data_provider.dart';
import 'package:riverpod2/model/user_model.dart';
import 'package:riverpod2/screens/data_screen.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(),
      body: _data.when(
          data: (_data){
            List<UserModel> userList = _data.map((e) => e).toList();
            return Column(
              children: [
                  Expanded(
                      child: ListView.builder(
                        itemCount: userList.length,
                      itemBuilder: (_,index){
                        return InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context)=>DetailsScreen(e: userList[index],))
                            );
                          },
                          child: Card(
                            color: Colors.lightBlue,
                            elevation: 4,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(userList[index].firstname,style: TextStyle(
                                color: Colors.white
                              ),),
                              subtitle: Text(userList[index].lastname,style: TextStyle(
                                  color: Colors.white
                              )),
                              trailing: CircleAvatar(
                                backgroundImage: NetworkImage(userList[index].avatar),
                              ),
                            ),
                          ),
                        );
                      })
                  )
              ],
            );
          },
          error: (err,s)=>Text(err.toString()),
          loading: ()=> Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
