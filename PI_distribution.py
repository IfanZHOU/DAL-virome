import pandas as pd
import matplotlib.pyplot as plt


data = pd.read_csv('00test_PI.csv')


bins = [i/4 for i in range(4, 56)]  
labels = [f'{i}-{i+0.25}' for i in bins[:-1]]

result_df = pd.DataFrame(index=labels)

for column in data.columns:
    frequency = pd.cut(data[column], bins=bins, labels=labels, include_lowest=True)
    total_points = frequency.count()  
    #print(frequency)
    #print(frequency.value_counts(normalize=True).sort_index())
    relative_frequency = frequency.value_counts(normalize=False).sort_index() / total_points  
    plt.plot(relative_frequency.index, relative_frequency.values * 100, label=column)
    result_df[column] = relative_frequency.values
    
result_df.to_csv('relative_frequency_results.csv', index_label='Interval')

plt.xlabel('Interval')
plt.ylabel('Relative Frequency (%)')
plt.title('Relative Frequency Distribution in Intervals')
plt.legend()



plt.savefig('output_chart.svg', format='svg')
plt.show()
