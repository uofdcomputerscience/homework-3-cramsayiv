import Foundation

// This homework should be fairly simple.
// visit https://github.com/noops-challenge/wordbot to read
// the documentation for wordbot.
//
// Using that documentation, write a playground that does
// the following:
// download 50 words
// decode those 50 words into an array of strings
// print the array of words, but with each word reversed
// print the average number of characters per word

func reversedList (myList: [String]) -> [String] {
    var reversedList = [String] ()
    for words in myList {
      reversedList.append(String(words.reversed()))
    }
  return reversedList
}

func avgChars (myList: [String]) -> Int {
    var totalChars = 0
    for words in myList {
        totalChars += words.count
    }
    return (totalChars/myList.count)
}

func printList(myList: [String]) {
  for words in myList {
    print(words)
  }
}

let urlString = "https://api.noopschallenge.com/wordbot?count=50"

if let url = URL (string: urlString) {
    let request = URLRequest(url: url)
    let session = URLSession(configuration: .ephemeral)
    let task = session.dataTask(with: request) { (data, response, error) in
        let myMainList = try! JSONDecoder().decode (Words.self, from: data!)
        printList(myList: reversedList(myList: myMainList.names))
        print(avgChars(myList: myMainList.names))
    }
    task.resume()
}
