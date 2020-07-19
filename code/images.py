import os
import matplotlib.pyplot as plt
import pandas

def read_responses_file(filepath):
    if os.path.isfile(filepath):
        dataframe = pandas.read_csv(filepath)
        return dataframe
    else:
        raise FileNotFoundError('Please, edit the path to the responses file.')

def create_fig_one(dataframe, output_dir):
    def plot_occupation(dataframe, filepath, plot_settings):
        fig, axes = plt.subplots()

        for index, value in dataframe.iloc[:, 4].str.startswith('Other').items():
            if value is True:
                dataframe.iloc[index, 4] = 'Other'

        plot_settings.update(ax = axes, title='Occupation')
        dataframe.iloc[:, 4].value_counts().plot(**plot_settings)

        plt.xticks(rotation=35, ha='right')
        plt.tight_layout()
        plt.savefig(filepath, format='eps')

    def plot_programming_experience(dataframe, filepath, plot_settings):
        fig, axes = plt.subplots()

        plot_settings.update(ax = axes, title='Experience with computer programming')
        dataframe.iloc[:, 5].value_counts().plot(**plot_settings)

        plt.xticks(rotation=35, ha='right')
        plt.tight_layout()
        plt.savefig(filepath, format='eps')

    def plot_plc_experience(dataframe, filepath, plot_settings):
        fig, axes = plt.subplots()

        plot_settings.update(ax = axes, title='Experience with PLCs')
        dataframe.iloc[:, 6].value_counts().plot(**plot_settings)

        plt.xticks(rotation=35, ha='right')
        plt.tight_layout()
        plt.savefig(filepath, format='eps')

    def plot_plc_languages(dataframe, filepath, plot_settings):
        occurrences = []
        fig, axes = plt.subplots()

        for index, row in dataframe.iloc[:, 7].items():
            if not pandas.isnull(row):
                languages = row.split(',')

                if 'No experience' not in languages:
                    for language in languages:
                        if language.startswith('Other'):
                            language = 'Other'
                        occurrences.append(language)

        dataframe = pandas.DataFrame(occurrences)
        plot_settings.update(ax = axes, title='Experience with IEC 61131-3 languages')
        dataframe.iloc[:, 0].value_counts().plot(**plot_settings)

        plt.xticks(rotation=35, ha='right')
        plt.tight_layout()
        plt.savefig(filepath, format='eps')

    plot_settings = {
        'kind': 'bar',
        'color': 'grey',
        'edgecolor': 'black',
        'yticks': range(0, 176, 25)
    }

    # Please select the role most applicable to you
    plot_occupation(dataframe, output_dir + 'fig1_occupation.eps', plot_settings)
    # How many years of previous programming experience do you have?
    plot_programming_experience(dataframe, output_dir + 'fig1_prg_experience.eps', plot_settings)
    # Do you have any prior experience with Programmable Logic Controllers?
    plot_plc_experience(dataframe, output_dir + 'fig1_plc_experience.eps', plot_settings)
    # Which programming languages do you use to write code for Programmable Logic Controllers?
    plot_plc_languages(dataframe, output_dir + 'fig1_iec_languages.eps', plot_settings)

def create_fig_two(dataframe, filepath):
    labels = ['Correct structure, symbols and labels',
              'Correct structure and symbols, wrong labels',
              'Correct structure and labels, wrong symbols',
              'Correct structure, wrong labels and symbols',
              'Wrong structure, symbols and labels']

    labels_occurrences = {key:[] for key in labels}
    column_indexes = [8, 10, 12, 14, 16]

    for c_index in column_indexes:
        for r_index, row in dataframe.iloc[:, c_index].items():
            dataframe.iloc[r_index, c_index] = dataframe.iloc[r_index, c_index][4:]

        occurrences = dataframe.iloc[:, c_index].value_counts().to_dict()
        
        for key in labels_occurrences.keys():
            if key in occurrences:
                labels_occurrences[key].append(occurrences[key])
            else:
                labels_occurrences[key].append(0)

    dataframe = pandas.DataFrame(labels_occurrences, index=['Q8','Q10','Q12','Q14','Q16'])
    dataframe.plot(kind='bar', stacked=True)
    plt.xticks(rotation=0)
    plt.tight_layout()
    plt.savefig(filepath, format='eps')

def create_fig_three(dataframe, filepath):
    correct_answers = {
        9: 'Light will only be turned ON when both Button A and Button B are ON.',
        11: 'Water Pump will be turned ON when the Button is ON and the Water Level Detector is OFF.',
        13: 'Light will be turned ON when Button A and Button B have different states (ON and OFF or OFF and ON)',
        15: 'Alarm will be turned ON when both the Smoke and Carbon Monoxide detectors are ON, or when the Test Button is ON.',
        17: 'Boiler will be turned ON when the Start Button is ON, and the Stop Button and Heat Sensor are OFF.'
    }

    for index, value in dataframe.iloc[:, 4].str.startswith('Other').items():
        if value is True:
            dataframe.iloc[index, 4] = 'Other'

    roles = dataframe.iloc[:, 4].dropna().unique()

    for role in roles:
        labels = ['Correct', 'Incorrect']
        labels_occurrences = {key:[] for key in labels}

        for c_index in correct_answers:
            answers = dataframe[dataframe.iloc[:, 4] == role].iloc[:, c_index].value_counts()

            if correct_answers[c_index] in answers.keys():
                labels_occurrences['Correct'].append(answers[correct_answers[c_index]])
            else:
                labels_occurrences['Correct'].append(0)

            incorrect_answers = 0

            for answer in answers.keys():
                if answer != correct_answers[c_index]:
                    incorrect_answers += answers[answer]

            labels_occurrences['Incorrect'].append(incorrect_answers)

        
        plotdata = pandas.DataFrame(labels_occurrences, index=['Q9','Q11','Q13','Q15','Q17'])
        plotdata.plot(kind='bar', stacked=True)
        plt.xticks(rotation=0)
        plt.legend(loc=8)
        plt.title(role)
        plt.tight_layout()
        plt.savefig(filepath + '_' + role, format='eps')

responses_filepath = '/home/fronchettl/Documents/Ladder Logic (Survey)/data/survey/Survey - Can you understand Ladder Logic (Complete) - Responses.csv'
images_dir = '/home/fronchettl/Documents/Ladder Logic (Survey)/data/paper/img/'
dataframe = read_responses_file(responses_filepath)
# create_fig_one(dataframe, images_dir)
# create_fig_two(dataframe, images_dir + 'fig2_writability_quest.eps')
create_fig_three(dataframe, images_dir + 'fig3_readability_quest.eps')