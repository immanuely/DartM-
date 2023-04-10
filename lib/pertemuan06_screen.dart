import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/pertemuan06_provider.dart';
import 'package:provider/provider.dart';

class Pertemuan06Screen extends StatefulWidget {
  const Pertemuan06Screen({Key? key}) : super(key: key);

  @override
  State<Pertemuan06Screen> createState() => _Pertemuan06ScreenState();
}

class _Pertemuan06ScreenState extends State<Pertemuan06Screen> {
  String itemSelected = "Pilih Pekerjaan";
  List items = [
    'Pilih Pekerjaan',
    'Mahasiswa',
    'Dosen',
    'Programmer',
    'UI UX Desainer',
    'IT Consultan',
    'Project Manager',
    'PNS',
    'Wiraswasta'
  ];
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Pertemuan06Provider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Switches | DropdownB')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark mode theme'),
                Switch(
                  value: prov.enableDarkMode,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    prov.setBrightness = val;
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pekerjaan'),
                DropdownButton(
                  items: items.map((item) {
                    return DropdownMenuItem(
                      child: Text(item),
                      value: item,
                    );
                  }).toList(),
                  value: itemSelected,
                  onChanged: (val) {
                    setState(() {
                      itemSelected = val as String;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
