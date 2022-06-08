import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'situation_class.dart';

class WeightEntryDialog extends StatefulWidget {
  final WeightEntry weightEntry;
  final Function(
    DateTime dateTime,
    int rating,
    String experience,
    String response,
    String result,
  ) onClickedDone;

  const WeightEntryDialog(
      {Key key, this.weightEntry, @required this.onClickedDone})
      : super(key: key);

  @override
  _WeightEntryDialogState createState() => _WeightEntryDialogState();
}

class _WeightEntryDialogState extends State<WeightEntryDialog> {
  final formKey = GlobalKey<FormState>();
  final experienceController = TextEditingController();
  final responseController = TextEditingController();
  final resultController = TextEditingController();

  DateTime _dateTime = DateTime.now();
  int _rating;

  List<String> topicOptions = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  @override
  void dispose() {
    experienceController.dispose();
    responseController.dispose();
    resultController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    if (widget.weightEntry != null) {
      final weightEntryEdit = widget.weightEntry;

      experienceController.text = weightEntryEdit.experience;
      responseController.text = weightEntryEdit.response;
      resultController.text = weightEntryEdit.result;
      _rating = weightEntryEdit.rating;
      _dateTime = weightEntryEdit.dateTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _createAppBar(context),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                buildDate(),
                const SizedBox(height: 8),
                buildAnxiety(),
                const SizedBox(height: 8),
                buildExperienceField(),
                const SizedBox(height: 10),
                buildExperience(),
                const SizedBox(height: 8),
                buildResponseField(),
                const SizedBox(height: 10),
                buildResponse(),
                const SizedBox(height: 8),
                buildResultField(),
                const SizedBox(height: 10),
                buildResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createAppBar(BuildContext context) {
    final isEditing = widget.weightEntry != null;
    final title = isEditing ? 'Edit Situation' : 'Add Situation';
    return AppBar(
      title: Text(title),
      actions: [
        //buildCancelButton(context),
        buildAddButton(context, isEditing: isEditing),
      ],
    );
  }

  Widget buildDate() => Card(
        child: ListTile(
          leading: Icon(Icons.today, color: Colors.grey[500]),
          title: DateTimeItem(
            dateTime: _dateTime,
            onChanged: (dateTime) => setState(() => _dateTime = dateTime),
          ),
        ),
      );

  Widget buildAnxiety() => Card(
        child: ListTile(
          leading: Icon(Icons.bar_chart, color: Colors.grey[500]),
          title: const Text('How high was your anxiety?'),
          trailing: PopupMenuButton<String>(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Text(
                (_rating == null) ? '0' : _rating.toString() + "/10",
              ),
            ),
            onSelected: (String value) {
              setState(() {
                _rating = int.parse(value);
              });
            },
            itemBuilder: (context) {
              return topicOptions.map<PopupMenuItem<String>>((String value) {
                return PopupMenuItem(
                    child: Text(value.toString()), value: value);
              }).toList();
            },
          ),
        ),
      );

  Widget buildExperienceField() => const Card(
        child: ListTile(
          leading: Text('1/3.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15)),
          title: Text(
              'What was the experience? What were your feelings, thoughts, or bodily sensations while it was happening?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15)),
        ),
      );

  Widget buildExperience() => ListTile(
        leading: Icon(Icons.speaker_notes, color: Colors.grey[500]),
        title: TextFormField(
          minLines: 3,
          maxLines: 6,
          controller: experienceController,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText:
                  "e.g Thoughts: I am contaminated with the virus.\nDoubts: Did I wash my hands?\nImages: My friend is lying in a hospital on a ventilator.",
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
              suffixIcon: experienceController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () => experienceController.clear(),
                      icon: const Icon(Icons.clear))
                  : null),
          validator: (experience) => experience != null && experience.isEmpty
              ? 'Please enter your experience'
              : null,
        ),
      );
  Widget buildResponseField() => const Card(
        child: ListTile(
          leading: Text('2/3.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15)),
          title: Text(
              'What did you do to in response to your feelings, thoughts, or bodily sensations?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15)),
        ),
      );

  Widget buildResponse() => ListTile(
        leading: Icon(Icons.speaker_notes, color: Colors.grey[500]),
        title: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 3,
          minLines: 2,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              suffixIcon: responseController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () => responseController.clear(),
                      icon: const Icon(Icons.clear))
                  : null,
              labelText:
                  """ e.g I washed my hands for some minutes and repeated a prayer.""",
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              )),
          validator: (experience) => experience != null && experience.isEmpty
              ? 'Please enter your response'
              : null,
          controller: responseController,
        ),
      );

  Widget buildResultField() => const Card(
        child: ListTile(
          leading: Text('3/3.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15)),
          title: Text(
              'What was the result of that response on the obsession and your life?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15)),
        ),
      );

  Widget buildResult() => ListTile(
        leading: Icon(Icons.speaker_notes, color: Colors.grey[500]),
        title: TextFormField(
          minLines: 2,
          maxLines: 3,
          controller: resultController,
          decoration: InputDecoration(
              border: const OutlineInputBorder(),
              suffixIcon: resultController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () => experienceController.clear(),
                      icon: const Icon(Icons.clear))
                  : null,
              labelText: "e.g I was unable to shake my sibling.",
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              )),
          validator: (experience) => experience != null && experience.isEmpty
              ? 'Please enter the result'
              : null,
        ),
      );

  /*  Widget buildCancelButton(BuildContext context) => ElevatedButton(
        child: Text('Cancel'),
        onPressed: () => Navigator.of(context).pop(),
      ); */

  Widget buildAddButton(BuildContext context, {bool isEditing}) {
    final text = isEditing ? 'Save' : 'Add';

    return ElevatedButton(
      child: Text(text),
      onPressed: () async {
        final isValid = formKey.currentState.validate();

        if (isValid) {
          final experience = experienceController.text;
          final response = responseController.text;
          final result = resultController.text;
          final rating = _rating;
          final dateTime = _dateTime;

          widget.onClickedDone(
            dateTime,
            rating,
            experience,
            response,
            result,
          );

          Navigator.of(context).pop();
        }
      },
    );
  }
}

class DateTimeItem extends StatelessWidget {
  DateTimeItem({Key key, DateTime dateTime, @required this.onChanged})
      : assert(onChanged != null),
        date = dateTime == null
            ? DateTime.now()
            : DateTime(dateTime.year, dateTime.month, dateTime.day),
        time = dateTime == null
            ? DateTime.now()
            : TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
        super(key: key);

  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: (() => _showDatePicker(context)),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(DateFormat('EEEE, MMMM d').format(date))),
          ),
        ),
        InkWell(
          onTap: (() => _showTimePicker(context)),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('$time')),
        ),
      ],
    );
  }

  Future _showDatePicker(BuildContext context) async {
    DateTime dateTimePicked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: date.subtract(const Duration(days: 20000)),
        lastDate: DateTime.now());

    if (dateTimePicked != null) {
      onChanged(DateTime(dateTimePicked.year, dateTimePicked.month,
          dateTimePicked.day, time.hour, time.minute));
    }
  }

  Future _showTimePicker(BuildContext context) async {
    TimeOfDay timeOfDay =
        await showTimePicker(context: context, initialTime: time);

    if (timeOfDay != null) {
      onChanged(DateTime(
          date.year, date.month, date.day, timeOfDay.hour, timeOfDay.minute));
    }
  }
}
