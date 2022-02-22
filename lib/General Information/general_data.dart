
class DataInfo {

  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List <String> images;


  DataInfo(
      this.position, {

        this.name,
        this.iconImage,
        this.description,
        this.images,

  });


}

List<DataInfo> features = [
  DataInfo(1,name: 'Obsessions',iconImage: 'assets/obsession.png',description: 'Obsessions are intrusive and recurring thoughts, images, or impulses that are persistent and uncontrollable (i.e., the person cannot stop the thoughts) and that usually appear irrational to the person experiencing them.',
  images: ['assets/extra_images/obsession_1.jpeg','assets/extra_images/obsession_2.jpeg']),
  DataInfo(2,name: 'Compulsions',iconImage: 'assets/thought.jpg',description: 'Compulsions are repetitive, clearly excessive behaviors or mental acts that the person feels driven to perform to reduce the anxiety caused by obsessive thoughts or to prevent some calamity from occurring.',
      images: ['assets/extra_images/thought_1.png','assets/extra_images/ritual_1.jpeg','assets/extra_images/ritual_2.jpeg','assets/extra_images/ritual_4.jpeg','assets/extra_images/thought_2.jpeg','assets/extra_images/thought_3.jpeg']),
  DataInfo(3,name: 'Fear of Contamination',iconImage: 'assets/fear.png',description: 'Contamination is an intense and persisting feeling of having been polluted or infected or endangered as a result of contact, direct or indirect, with a person/place/object that is perceived to be soiled, impure, infectious or harmful.',
      images: ['assets/extra_images/fear_1.jpeg','assets/extra_images/fear_2.jpeg','assets/extra_images/fear_3.jpeg','assets/extra_images/fear_4.jpeg','assets/extra_images/fear_5.jpeg']),
  DataInfo(4,name: 'Disgust',iconImage: 'assets/disgust.png',description: 'Disgust is a common and often intense emotion that frequently defies control. The physical reactions to stimuli that evoke disgust include an array of gastric sensations such as nausea, gagging, vomiting.',
      images: ['assets/extra_images/disgust_1.jpeg','assets/extra_images/disgust_2.jpeg','assets/extra_images/disgust_3.jpeg']),
];
