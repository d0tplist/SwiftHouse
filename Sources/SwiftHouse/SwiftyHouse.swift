
import Foundation

class SwiftyHouse {
    
        /*
        Example: http://localhost:32773/
        */
        let baseUrl: String

        public required init(baseUrl: String, database: String) {
            self.baseUrl = (baseUrl + "?database=" + database + "&")
        }

        /*
        Spected: http://localhost:32773/?query=
        */
        private func buildQuery(query: String) -> String {
            return baseUrl + "query=" + query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        }

        public func querySingleResult(query: String) -> String? {
            return HttpClient.get(url: buildQuery(query: query))
        }

        /**
        * Returns a JSON representing the resultset
        **/
        public func query(query: String) -> String? {

            let resultURL = buildQuery(query: query + " FORMAT JSONEachRow;")

            print(resultURL)
            
            if let result = HttpClient.get(url: resultURL) {
            
                let split = result.split(separator: "\n")
                
                if(split.count > 1){
                    let sub = result.replacingOccurrences(of: "}\n", with: "},\n")
                    
                    let chars = sub.dropLast(2)
                    
                    return "{ \"data\" : [\(String(chars))]}";
                }
                
                return "{ \"data\" : [\(result)]}";
            }

            return nil
        }

    }


