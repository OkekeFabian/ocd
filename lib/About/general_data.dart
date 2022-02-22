class FeatureInfo {

  final int position;
  final String name;
  final String iconImage;
  final String description;
  final int color;


  FeatureInfo(
      this.position, {

        this.name,
        this.iconImage,
        this.description,
        this.color,

      });


}



List<FeatureInfo> features = [
  FeatureInfo(1,name: 'Information Gathering',iconImage: 'assets/obsession.png',description: 'This part is to be filled with your therapist after you have an understanding of your situation over some sessions. It includes some questions that you should answer in order to store information about your condition. You can look up terms in the General Information area.',color: 0xFF414C6B),
  FeatureInfo(1,name: 'General Information',iconImage: 'assets/obsession.png',description: 'This part covers the definitions with pictures on the main terms.',color: 0xFF6751B5),
  FeatureInfo(1,name: 'Self Monitoring',iconImage: 'assets/obsession.png',description: 'This part is to be filled on instructions from your therapist to fill whenever you give in to your obsession.',color: 0xFF9354B9),
  FeatureInfo(1,name: 'Goals',iconImage: 'assets/obsession.png',description: 'This part is where you can set personal goals for short, mid or long term. Can also be done with your therapist.',color: 0xFF414C6B),
  FeatureInfo(1,name: 'Schedule an Event',iconImage: 'assets/obsession.png',description: 'This part can be used to schedule your sessions with your therapist and any other event.',color: 0xFF6751B5),
];
