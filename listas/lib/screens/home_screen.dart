import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:listas/classes/comidas.dart';
import 'package:listas/screens/details_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home';
  HomeScreen({super.key});

  List<Comidas> comidas = [
    Comidas('Asado', 'Argentina', 'https://as1.ftcdn.net/v2/jpg/04/77/06/40/1000_F_477064011_2USAki8hu3nI2nHTq6nbsaBcXX6SSihv.jpg','La carne asada es una tradición añeja proveniente de las grandes extensiones fértiles de la llanura pampeana. Pero el asado argentino es más que la comida típica; es todo un ritual.  '),
    Comidas('Tacos', 'Mexico', 'https://mandolina.co/wp-content/uploads/2023/06/tacos-clasicos.png','El taco es una preparación culinaria muy popular de México que consiste en una tortilla, generalmente de maíz, que comúnmente se enrolla para contener dentro diversos ingredientes y algún tipo de salsa y verdura.'),
    Comidas('Ceviche', 'Peru', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCs3qt_RdjpwRqgo9iiMEKc5IuW4cshDwEnA&s','Es básicamente pescado crudo y mariscos marinados en jugo de cítricos, principalmente jugo de limón. El cítrico del jugo coagula las protenínas del pescado, efectivamente cocinándolo, así no calentándolo, y se sirve frío o a temperatura ambiente.'),
    Comidas('Feijoada', 'Brasil', 'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/ras/Assets/bf0b6a9ffe1e83960ebf31ed8af6d05f/Derivates/eabadaf71c49ba2b4c70d7317518fa5225c6bc82.jpg','La feijoada o frijolada es el plato nacional de Brasil, se trata de un guiso de alubias negras o frijoles y verduras, acompañados de carne de cerdo y embutidos.'),
    Comidas('Ramen', 'Japon', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZoqngBcRAQmN0zVdgRrbrpxBJpyCE7TOFOA&s','Es una sopa de fideos, de origen chino, normalmente preparada con una base de caldo de carne, que se sirve con una gran variedad de toppings.'),
    Comidas('Dumplings', 'China', 'https://images.squarespace-cdn.com/content/v1/55be995de4b071c106b3b4c0/6af0cbeb-8a58-4993-ab68-8e9919d6d04c/Salmon+Dumplings-6.jpg','Los dumplings son pequeñas bolitas rellenas, muy parecidas a una empanada, pero con la particularidad de que sus masas suelen elaborarse con harinas de trigo, arroz o tapioca y se clasifican dependiendo el relleno o la forma. La manera tradicional de prepararlos es al vapor, aunque también se pueden hacer hervidas o fritas.  '),
    Comidas('Paella','España', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe-e2r9TBmYcnH7BWNcR0bZ83RVRu7rHLP_A&s','La paella es un plato típico de la cocina española, originario de la Comunidad Valenciana, que consiste en arroz seco cocido en una paellera con diferentes ingredientes, como carnes, mariscos o verduras.'),
    Comidas('Pizza','Italia', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvG9dRvJfR6l8T54Lv4vbU_ZbkmaWfh56h0w&s','Se trata de un pan plano horneado, habitualmente de forma redonda, elaborado con harina de trigo, sal, agua y levadura, cubierto con salsa de tomate y queso. Existe una gran cantidad de variedades según el formato del pan, la forma de cocinarlo y la combinación de diferentes ingredientes.'),
    Comidas('Croissant','Francia', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXcF5TNW7MiU1X6nBMqDB3nS0ypW56ma4F5A&s','Panecillo aceitoso de pasta de hojaldre cocido al horno y con forma de media luna, de origen frances el croissant es una de las joyas de la pasteleria.'),
    Comidas('Chucrut','Alemania', 'https://i0.wp.com/sabordelobueno.com/wp-content/uploads/2019/10/como-hacer-chucrut-casero-2.jpg?fit=1367%2C855&ssl=1','Es una preparación culinaria que se elabora a través de la fermentación de las hojas frescas del repollo o de la col. El proceso de fermentación ocurre cuando las bacterias y las levaduras presentes en forma natural en el repollo entran en contacto con los azúcares que libera'),
    Comidas('Arepas','Venezuela', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNgE7zEWCckda2JV3G8PVN0jNi9DDxY77mmw&s','La arepa es un alimento típico de Colombia, Venezuela y Bolivia. De origen precolombino, está hecha a base de masa de maíz seco molido o de harina de maíz precocida, es de forma circular y aplanada, pueden tener rellenos dulces y salados.'),
    Comidas('Pad Thai','Tailandia', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3SgrbB8dPr81hOVM8wxc7cDcIbxt8TXXzLA&s','Se trata de un plato salteado en wok, y a base de fideos de Arroz con huevo, salsa de pescado, pasta de tamarindo, y cualquier combinación de brotes de soja, camarones, pollo decorado con cacahuates picados igual que tostados y cilantro, algunos expertos coreanos utilizan dos tipos de salsa de soja'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de comidas del mundo'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: comidas.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(comidas[index].imagen, width: 50, height: 50, fit: BoxFit.cover),
              ),
              title: Text(
                comidas[index].nombre,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text(
                'Origen: ${comidas[index].origen}',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
              onTap: () {
                context.pushNamed(DetailScreen.name, extra: comidas[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
