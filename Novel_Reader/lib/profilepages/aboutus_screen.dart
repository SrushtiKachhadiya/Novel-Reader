import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
                Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,),
                ),
            ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 10.0,left: 10),
          child: Column(
            children: [
              Divider(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'About Us',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
              Text(
                '      Welcome to NovelReader, your go-to destination for exploring captivating novels and immersive stories from around the world. At NovelReader, we are passionate about creating a space where readers can discover, indulge, and connect with their favorite stories, all in one convenient platform.',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: Text(
                  'Our Mission:',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                '      At NovelReader, our mission is simple: to fuel the love for reading and storytelling. We believe that stories have the power to inspire, entertain, and unite people across cultures and backgrounds. By providing a diverse collection of novels and stories, we aim to foster a community of avid readers who can escape into worlds of imagination and creativity at any time, anywhere.',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: Text(
                  'What Sets Us Apart:',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  '      Extensive Collection: ',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),

              Text(
                '           We curate a vast library of novels spanning various genres, from romance and mystery to fantasy and science fiction. Whether you are in the mood for a heartwarming love story or an adrenaline-pumping thriller, we have something for every reader.',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5,top: 8),
                child: Text(
                  '      User-Friendly Experience: ',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                '           Our app is designed with simplicity and ease of use in mind. With intuitive navigation and personalized recommendations, finding your next favorite read has never been easier.',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, top: 8),
                child: Text(
                  '      Accessibility: ',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                '           We believe that everyone should have access to great literature. That is why we strive to make our app accessible to readers of all ages and backgrounds, regardless of their location or device.',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, top: 8),
                child: Text(
                  '      Community Engagement: ',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                '           We value the importance of community and connection. Through features such as reader reviews, discussion forums, and author interviews, we encourage readers to engage with each other and with the creators behind the stories they love.',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: Text(
                  'Our Team:',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                '      Behind NovelReader is a dedicated team of book lovers, tech enthusiasts, and creatives who are committed to delivering an exceptional reading experience. From our developers and designers to our content curators and customer support team, each member plays a crucial role in bringing our vision to life.',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20,bottom: 10),
                child: Text(
                  'Get Started:',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                '      Ready to embark on your reading journey? Download NovelReader today and start exploring our vast collection of novels and stories. Whether you are a seasoned bookworm or just starting to discover the joys of reading, we invite you to join our community and immerse yourself in the magic of storytelling.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 15,),
              Text(
                '      Thank you for choosing NovelReader. Happy reading!',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
