using System;
using System.Collections.Generic;
using Json.Net;
using MongoDB.Bson;
using MongoDB.Driver;
using System.Linq;
using System.IO;

namespace GAGN3GS05DU_Verk1
{
    class WordCount
    {
        public WordCount(string word)
        {
            this.word = word;

            this.count = 1;

        }

        public string word{ get; set; }
        public int count { get; set; }

        public void add1()
        {
            count++;
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            MongoClient dbClient = new MongoClient("mongodb://localhost:27017");
            var database = dbClient.GetDatabase("TrueFacktsAmazingNotClickbait");
            var collection = database.GetCollection<BsonDocument>("Clickbait");

            long numberOfWords = 0;

            var allWords = new List<string>();

            char[] trimchar = { ',', "'".ToCharArray()[0], '"' };

            collection.Find(new BsonDocument()).ForEachAsync(X => {
                string[] words = X.ToString().Split(' ');
                foreach (var word in words)
                {
                    numberOfWords++;
                    word.Replace(",", string.Empty);
                    word.Replace("'", string.Empty);
                    word.Replace('"'.ToString(), string.Empty);

                    allWords.Add(word);
                }



            });

            Console.Read();

            Console.WriteLine(numberOfWords.ToString());

            allWords.Sort();

            var wordsCount = new List<WordCount>();
            WordCount tempToDel = new WordCount("123456789");
            wordsCount.Add(tempToDel);

            foreach (string word in allWords)
            {

                if (wordsCount[wordsCount.Count - 1].word == word)
                {
                    wordsCount[wordsCount.Count - 1].add1();
                }
                else
                {
                    WordCount temp = new WordCount(word);
                    wordsCount.Add(temp);
                }

                if (wordsCount[0].word == "123456789")
                {
                    wordsCount.RemoveAt(0);
                }
            }

            TextWriter tw = new StreamWriter(@"text.txt");

            foreach (WordCount word in wordsCount)
            {
                tw.WriteLine((word.word + ": " + word.count));
            }

            tw.Close();

            tw = new StreamWriter(@"sortText.txt");

            List<WordCount> numSort = wordsCount.OrderBy(x => x.count).ToList();

            foreach (WordCount word in numSort)
            {
                tw.WriteLine((word.word + ": " + word.count));
            }
        }
    }
}
