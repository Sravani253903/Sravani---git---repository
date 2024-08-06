import pandas as pd
"""df = pd.read_csv("income.csv") #reading the csv using pandas
print(df)

income_dc = df.columns # all data columns from the income dataset
print(income_dc)

#first two columns from the income dataset
print (income_dc[:2])

#find data types for all columns
print(df.dtypes)

df. Y2008 = df. Y2008.astype (float) #converts integer type into float datatype
print (df.dtypes)
print ("total number of rows and columns:", df.shape)
print ("total number of rows:", df.shape [0])
print ("total number of columns:", df.shape [1])

print ("First Five Rows from income dataset")
print (df.head())

print ("Last Five Rows from income dataset")
print (df.tail())

print ("First three Rows from income dataset")
print (df.head(3))

print ("Last three Rows from income dataset")
print (df.tail(3))

print (df.iloc[0:5])
print (df[0:5])

print ("Distinct values of the column index")
u_values = df.Index.unique()
print(u_values, len(u_values))

print ("biverate frequency distribution")
print(pd.crosstab(df.index,df.State))

print("creating frequency distribution based on Index")
print(df.Index.value_counts(ascending=True))

#Random Sampling
data = df.sample(n=10) #getting 10 rows as sample from entire dataset
print(data)

data=df.sample(frac=0.1) #sample of 10% of the entire dataset
print(data)
print(data["State"], data.State) #selecting columns

#multiple columns by Name
print(df[["Index", "State", "Y2008"]])
data = df.loc[:2,["Index","State","Y2008"]]
print(data)

data = df.loc[0:2,["Index","State","Y2008"]]
print(data)

data = df.iloc[0:5,0:4]
print(data)



Zodiac_data = pd.DataFrame ({"Name":["John","Mary","Julia","Kenny","Henry"],
                             "Sunsign":["Libra","Virgo","Leo","Capricon","Aries"]})
print (Zodiac_data)
print(Zodiac_data.columns)

Zodiac_data.columns = ["Name","SunSigns"] #remaining the columns
print(Zodiac_data)

Zodiac_data.rename(columns = {"Names":"Cust_Name" },inplace=True) #renaming the colun
print(Zodiac_data)

df.columns = df.columns.str.replace('Y','Year')
print(df.columns)
print(df.head())

df.set_index("Index",inplace=True)
print(df.columns)
print(df.head())

df.reset_index(inplace=True)
data = df.drop (['Index', 'State'], axis=1) #dropping columns Index and State
data = df.drop ('Index', axis="columns") #dropping column Index
print(data)

data = df.drop(0,axis=0) #removing first row
data = df.drop([0,1,2,4],axis=0) #removing multiple row with given index
print(data)

print(df.sort_values("State",ascending=False))
print(df.Year2008.sort_values())
print(df.sort_values(["Index","State"])) 


df["difference"] =df.Year2008 - df.Year2009
print(df["difference"])

df["difference2"] =df.eval("Year2003-Year2002")
print(df.head())

df.ratio = df.Year2008/df.Year2009
print(df.ratio)

data = df.assign(ratio = (df.Year2008/df.Year2009))
print(data.head())

print(df.describe()) #for numeric variables

print(df.describe(include=['object'])) #only for strings/objects

print(df.Year2008.mean(),df.Year2008.median(),df.Year2008.agg(["mean","median"]))

print(df.Year2008.min())



""" Group By Functions """
print(df.groupby("Index")[["Year2002","Year2003"]].min())

print(df.groupby("Index")[["Year2002","Year2003"]].agg(["min","max","mean"]))

print(df.groupby("Index").agg({"Year2002":[min,max],"Year2003": "mean"}))

dt = df.groupby("Index").agg({"Year2002":[min,max],"Year2003": "mean"})
dt.columns = ['Y2002_min', 'Y2022_max', 'Y2003_mean']
print(dt)

print(df.groupby(["Index","State"]).agg({"Year2002":[min,max],"Year2003": "mean"}))



""" Filtering """
print(df[df.Index=="A"])

print(df.loc[df.Index=="A"]) #All the columns where Index is A

print(df.loc[df.Index=="A","State"])# only State Column where Index is A

#filter the rows with index as A and salary greater than 15 lacs
print(df.loc[(df.Index=="A") & (df.Year2002 > 1500000),:])
#filter the  rows with index either A or W
print(df.loc[(df.Index=="A") | (df.Index=="W"),:])
##alternative
print(df.loc[df.Index.isin(["A","W"]),:])
#alternative
print(df.query("Year2002>1700000 & Year2003>1500000")) """



iris = pd.read_csv("iris.csv")
print(iris)










