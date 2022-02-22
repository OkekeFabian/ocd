class FirstPageInfo {

  final int position;
  final String name;
  final String iconImage;
  final String description;
  final String status;



  FirstPageInfo(
      this.position, {
        this.name,
        this.iconImage,
        this.description,
        this.status
      });


}

List<FirstPageInfo> areas = [
  FirstPageInfo(1,name: 'Begin your Journey',iconImage: 'assets/extra_images/information-gathering.jpg',description: 'Get general Information about OCD and fill in information about situations you face',status: 'Know your OCD'),
  FirstPageInfo(2,name: 'Begin Recording',iconImage: 'assets/extra_images/self-monitoring.jpeg',description: 'Monitor your Obsessions after completing the Know your OCD section',status: 'Self-Monitoring'),
];