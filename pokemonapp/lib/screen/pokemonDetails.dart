import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokemonapp/controllers/pokemon.dart';
import 'package:pokemonapp/models/pokemon_details.dart';
import 'package:pokemonapp/models/pokemon_list.dart';
import 'package:pokemonapp/screen/pokemonList.dart';

import '../controllers/text_controller.dart';

class pokemonDetails extends StatefulWidget {
  const pokemonDetails({super.key,this.Id,this.Name});
  final String? Id;
  final String? Name;

  @override
  State<pokemonDetails> createState() => _pokemonDetailsState();
}

class _pokemonDetailsState extends State<pokemonDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,),
                child: Container(
                  height: MediaQuery.of(context).size.height/15,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PokemonList()));
                        },
                        icon: ImageIcon(
                          AssetImage("images/Back_Icon.png"),
                          size: 20,
                          color: Color.fromRGBO(17, 37, 46, 1),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Text(
                        "Pokemon Details",
                        style: TextController().myStyle(
                          size: 20,
                          color: Color.fromRGBO(17, 37, 46, 1),
                          fs: FontStyle.normal,
                          fw: FontWeight.w400,
                        ),
                      ),

                    ],
                  ),
                ),
              )
          ),

          SliverToBoxAdapter(
            child: FutureBuilder<Pokamondetails?>(
              future: Pokemons().pokemonDetails(context, widget.Id!, widget.Name!),
              builder: (BuildContext context,snapshot){
                if(snapshot.hasData){
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height/3.5,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("${snapshot.data!.image}"),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        Container(
                          height:  MediaQuery.of(context).size.height/3.7,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: RichText(
                            text: TextSpan(
                                text: "Name : ",
                                style: TextController().myStyle(
                                  size: 20,
                                  color: const Color.fromRGBO(17, 37, 46, 1),
                                  fs: FontStyle.normal,
                                  fw: FontWeight.w400,
                                ),
                                children:[
                                  TextSpan(text: "${snapshot.data!.name}\n",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w700,
                                    ),),
                                  TextSpan(text: "Weight : ",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w400,
                                    ),),
                                  TextSpan(text: "${snapshot.data!.weight!.minimum} - ${snapshot.data!.weight!.maximum}\n",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w700,
                                    ),),
                                  TextSpan(text: "Height : ",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w400,
                                    ),),
                                  TextSpan(text: "${snapshot.data!.height!.minimum} - ${snapshot.data!.height!.maximum}\n",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w700,
                                    ),),
                                  TextSpan(text: "Classification : ",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w400,
                                    ),),
                                  TextSpan(text: "${snapshot.data!.classification}\n",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w700,
                                    ),),
                                  TextSpan(text: "FleeRate : ",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w400,
                                    ),),
                                  TextSpan(text: "${snapshot.data!.fleeRate}\n",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w700,
                                    ),),
                                  TextSpan(text: "MaxCP : ",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w400,
                                    ),),
                                  TextSpan(text: "${snapshot.data!.maxCP}\n",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w700,
                                    ),),
                                  TextSpan(text: "MaxHP : ",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w400,
                                    ),),
                                  TextSpan(text: "${snapshot.data!.maxHP}\n",
                                    style: TextController().myStyle(
                                      size: 20,
                                      color: const Color.fromRGBO(17, 37, 46, 1),
                                      fs: FontStyle.normal,
                                      fw: FontWeight.w700,
                                    ),),
                                ]
                            ),
                          ),
                        ),
                        SizedBox(height: 2,),
                        Text(
                            "Resistant",
                          style: TextController().myStyle(
                            size: 25,
                            color: const Color.fromRGBO(17, 37, 46, 1),
                            fs: FontStyle.normal,
                            fw: FontWeight.w700,
                          ),
                        ),

                        Container(
                          height: MediaQuery.of(context).size.height/15,
                          width: MediaQuery.of(context).size.width/1,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.resistant!.length,
                              itemBuilder: (BuildContext context, int index){
                                return Text(
                                  "${snapshot.data!.resistant![index]} ,",
                                  style: TextController().myStyle(
                                    size: 20,
                                    color: const Color.fromRGBO(17, 37, 46, 1),
                                    fs: FontStyle.normal,
                                    fw: FontWeight.w400,
                                  ),
                                );
                              }
                          ),
                        ),

                        SizedBox(height: 2,),

                        Text(
                          "Types",
                          style: TextController().myStyle(
                            size: 25,
                            color: const Color.fromRGBO(17, 37, 46, 1),
                            fs: FontStyle.normal,
                            fw: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/15,
                          width: MediaQuery.of(context).size.width/1,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.types!.length,
                              itemBuilder: (BuildContext context, int index){
                                return Text(
                                  "${snapshot.data!.types![index]} ,",
                                  style: TextController().myStyle(
                                    size: 20,
                                    color: const Color.fromRGBO(17, 37, 46, 1),
                                    fs: FontStyle.normal,
                                    fw: FontWeight.w400,
                                  ),
                                );
                              }
                          ),
                        ),
                        SizedBox(height: 2,),
                        Text(
                          "Weaknesses",
                          style: TextController().myStyle(
                            size: 25,
                            color: const Color.fromRGBO(17, 37, 46, 1),
                            fs: FontStyle.normal,
                            fw: FontWeight.w700,
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/15,
                          width: MediaQuery.of(context).size.width/1,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.weaknesses!.length,
                              itemBuilder: (BuildContext context, int index){
                                return Text(
                                  "${snapshot.data!.weaknesses![index]} ,",
                                  style: TextController().myStyle(
                                    size: 20,
                                    color: const Color.fromRGBO(17, 37, 46, 1),
                                    fs: FontStyle.normal,
                                    fw: FontWeight.w400,
                                  ),
                                );
                              }
                          ),
                        ),
                        SizedBox(height: 2,),

                        Text(
                          "Attacks",
                          style: TextController().myStyle(
                            size: 25,
                            color: const Color.fromRGBO(17, 37, 46, 1),
                            fs: FontStyle.normal,
                            fw: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 2,),
                        Container(
                          height: MediaQuery.of(context).size.height/8,
                          width: MediaQuery.of(context).size.width/1,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.attacks!.fast!.length,
                              itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/8,
                                    width: MediaQuery.of(context).size.width/2,
                                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(236, 236, 236, 1),
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Name : ",
                                        style: TextController().myStyle(
                                          size: 14,
                                          color: const Color.fromRGBO(17, 37, 46, 1),
                                          fs: FontStyle.normal,
                                          fw: FontWeight.w400,
                                        ),
                                        children: [
                                          TextSpan(text: "${snapshot.data!.attacks!.fast![index].name}\n",
                                            style: TextController().myStyle(
                                              size: 14,
                                              color: const Color.fromRGBO(17, 37, 46, 1),
                                              fs: FontStyle.normal,
                                              fw: FontWeight.w700,
                                            ),),
                                          TextSpan(text: "Type : ",
                                            style: TextController().myStyle(
                                              size: 14,
                                              color: const Color.fromRGBO(17, 37, 46, 1),
                                              fs: FontStyle.normal,
                                              fw: FontWeight.w400,
                                            ),),
                                          TextSpan(text: "${snapshot.data!.attacks!.fast![index].type}\n",
                                            style: TextController().myStyle(
                                              size: 14,
                                              color: const Color.fromRGBO(17, 37, 46, 1),
                                              fs: FontStyle.normal,
                                              fw: FontWeight.w700,
                                            ),),
                                          TextSpan(text: "Damage : ",
                                            style: TextController().myStyle(
                                              size: 14,
                                              color: const Color.fromRGBO(17, 37, 46, 1),
                                              fs: FontStyle.normal,
                                              fw: FontWeight.w400,
                                            ),),
                                          TextSpan(text: "${snapshot.data!.attacks!.fast![index].damage}\n",
                                            style: TextController().myStyle(
                                              size: 14,
                                              color: const Color.fromRGBO(17, 37, 46, 1),
                                              fs: FontStyle.normal,
                                              fw: FontWeight.w700,
                                            ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                        SizedBox(height: 2,),
                        Container(
                          height: MediaQuery.of(context).size.height/8,
                          width: MediaQuery.of(context).size.width/1,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.attacks!.special!.length,
                              itemBuilder: (BuildContext context, int index){
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/8,
                                    width: MediaQuery.of(context).size.width/2,
                                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(236, 236, 236, 1),
                                        borderRadius: BorderRadius.circular(12)
                                    ),
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Name : ",
                                        style: TextController().myStyle(
                                          size: 14,
                                          color: const Color.fromRGBO(17, 37, 46, 1),
                                          fs: FontStyle.normal,
                                          fw: FontWeight.w400,
                                        ),
                                        children: [
                                          TextSpan(text: "${snapshot.data!.attacks!.special![index].name}\n",
                                            style: TextController().myStyle(
                                              size: 14,
                                              color: const Color.fromRGBO(17, 37, 46, 1),
                                              fs: FontStyle.normal,
                                              fw: FontWeight.w700,
                                            ),),
                                          TextSpan(text: "Type : ",
                                            style: TextController().myStyle(
                                              size: 14,
                                              color: const Color.fromRGBO(17, 37, 46, 1),
                                              fs: FontStyle.normal,
                                              fw: FontWeight.w400,
                                            ),),
                                          TextSpan(text: "${snapshot.data!.attacks!.special![index].type}\n",
                                            style: TextController().myStyle(
                                              size: 14,
                                              color: const Color.fromRGBO(17, 37, 46, 1),
                                              fs: FontStyle.normal,
                                              fw: FontWeight.w700,
                                            ),),
                                          TextSpan(text: "Damage : ",
                                            style: TextController().myStyle(
                                              size: 14,
                                              color: const Color.fromRGBO(17, 37, 46, 1),
                                              fs: FontStyle.normal,
                                              fw: FontWeight.w400,
                                            ),),
                                          TextSpan(text: "${snapshot.data!.attacks!.special![index].damage}\n",
                                            style: TextController().myStyle(
                                              size: 14,
                                              color: const Color.fromRGBO(17, 37, 46, 1),
                                              fs: FontStyle.normal,
                                              fw: FontWeight.w700,
                                            ),),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                  );
                }else{
                  print(snapshot.error);
                  return Center(child: CircularProgressIndicator(color: Color.fromRGBO(234, 10, 120, 1),),);
                }

              },
            ),
          )
        ],
      ),
    );
  }
}