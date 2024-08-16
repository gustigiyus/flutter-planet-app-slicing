import 'package:flutter/material.dart';
import 'package:flutter_latihan_slicing_1/Model/universe_model.dart';
import 'package:flutter_latihan_slicing_1/Utils/app_styles.dart';
import 'package:flutter_latihan_slicing_1/Utils/size_config.dart';

class DetailPage extends StatefulWidget {
  final PlanetInfo planetInfo;
  const DetailPage({super.key, required this.planetInfo});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isExpandText = false;
  void toogleExpanded() {
    setState(() {
      _isExpandText = !_isExpandText;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 280,
                        ),
                        Text(
                          widget.planetInfo.name,
                          style: kFontSansSuperExtraBold.copyWith(
                            color: primaryTextColor,
                            fontSize: SizeConfig.blockSizeHorizontal! * 15,
                          ),
                        ),
                        Text(
                          "Solar System",
                          style: kFontSansMedium.copyWith(
                            color: primaryTextColor,
                            fontSize: SizeConfig.blockSizeHorizontal! * 8.5,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(
                          color: Colors.black12,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.planetInfo.description,
                          maxLines: _isExpandText ? null : 5,
                          overflow: _isExpandText
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                          style: kFontSansMedium.copyWith(
                            color: contentTextColor,
                            fontSize: SizeConfig.blockSizeHorizontal! * 5,
                          ),
                        ),
                        GestureDetector(
                          onTap: toogleExpanded,
                          child: Text(
                            _isExpandText ? "Read less" : "Read more",
                            style: kFontSansBold.copyWith(
                              color: Colors.amber,
                              fontSize: SizeConfig.blockSizeHorizontal! * 5,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "      Galery",
                    style: kFontSansBold.copyWith(
                      color: primaryTextColor,
                      fontSize: SizeConfig.blockSizeHorizontal! * 5.5,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: SizedBox(
                      height: 250,
                      child: ListView.builder(
                        itemCount: widget.planetInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: Image.network(
                                widget.planetInfo.images[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: -42,
              child: Hero(
                tag: widget.planetInfo.id,
                child: Image.asset("assets/${widget.planetInfo.iconImage}"),
              ),
            ),
            Positioned(
              child: Text(
                widget.planetInfo.id.toString(),
                style: kFontSansSuperExtraBold.copyWith(
                  color: primaryTextColor.withOpacity(0.1),
                  fontSize: SizeConfig.blockSizeHorizontal! * 60,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
