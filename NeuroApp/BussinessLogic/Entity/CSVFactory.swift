//
//  CSVFactory.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19.02.2022.
//

import CSV

class CSVFactory {
    func createCSV(from history: [Session]) throws -> URL {
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                            .userDomainMask,
                                                           true)[0]
        let url = URL(fileURLWithPath: filePath).appendingPathComponent("NeuroApp.csv")
        
        let output = OutputStream(toMemory: ())
        let csv = try CSVWriter(stream: output)
        try csv.write(row: String.Export.titleArr)
        
        try history.enumerated().forEach { index, session in
            try write(in: csv, with: session, index: index)
            
        }
        csv.stream.close()
        
        let buffer = output.property(forKey: .dataWrittenToMemoryStreamKey) as! Data
        try buffer.write(to: url)
        
        return url
    }
    
    func prepareTitleArr(with session: Session) -> [String] {
        let partOneQuestionsArr = session.partOneAnswers.map { answer in
            return answer.questionText
        }
        return partOneQuestionsArr + String.Export.titleArr
    }
    
    private func write(in csv: CSVWriter, with session: Session, index: Int) throws {
        csv.beginNewRow()
        try csv.write(field: String.session + " " + index.description)
        try session.partOneAnswers.forEach { answer in
            try csv.write(field: answer.value.description)
        }
        try csv.write(field: session.partOneScore.description)
        try csv.write(field: session.partTwoAverageTime.description)
        try csv.write(field: session.partTwoCountRightAnswer.description)
        try csv.write(field: session.partTwoScore.description)
        try csv.write(field: session.partThreeAnswer.question)
        try csv.write(field: session.partThreeAnswer.userText)
        try csv.write(field: session.partThreeAnswer.ganningFoq.description)
        try csv.write(field: session.partThreeScore.description)
        try csv.write(field: session.avarageScore.description)
    }
}
