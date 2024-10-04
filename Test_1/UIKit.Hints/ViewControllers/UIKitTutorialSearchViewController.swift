//
//  UIKitTutorialSearchController.swift
//  Test_1
//
//  Created by admin_user on 27/08/24.
//

//
//  UIKitTutorialSearchController.swift
//  Test_1
//
//  Created by admin_user on 27/08/24.
//

import Foundation
import UIKit
import Speech

class SimpleTBLV: UIViewController {
    
    let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)

    var infoList: [Info] = []
    var filteredInfo: [Info] = []
    
    var isRecording = false
    var speechButton = UIButton()
    
    var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
     
    var recognitionTask: SFSpeechRecognitionTask?
      let audioEngine = AVAudioEngine()
      let speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //mic.fill.
        //magnifyingglass
 
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"),
                                                            style: .plain,
                                                            target: self, action: #selector(onClose))
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
        navigationItem.title = "Weather"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.hidesSearchBarWhenScrolling = false
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.hidesBackButton = true

        infoList = Info.createSampleList()
        setSearchController()
        addTableView()
    }
    
    @objc
    func onClose(){
        print("taped")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            searchController.searchBar.text = nil
            tableView.deselectRow(at: indexPath, animated: true)
        }
        tableView.reloadData()
    }
    
    func setSearchController(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.delegate = self
        searchController.searchBar.showsCancelButton = true
 
        searchController.searchBar.setImage( UIImage(systemName: "mic.fill"), for: .bookmark, state: .normal)
        searchController.searchBar.showsBookmarkButton = true
 
        navigationItem.searchController = searchController
    }

    func addTableView(){
        view.addSubview(tableView)
//        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredInfo = infoList.filter { (info: Info) -> Bool in
            return info.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
     
}

extension SimpleTBLV: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return isFiltering ? filteredInfo.count :  infoList.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let info: Info
        if isFiltering {
            info = filteredInfo[indexPath.row]
        } else {
            info = infoList[indexPath.row]
        }
        cell.textLabel?.text = info.name
        cell.detailTextLabel?.text = String(info.temperature)
        return cell
    }
}

extension SimpleTBLV: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
        changeButtonSpeech()

    }
}

extension SimpleTBLV: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
        changeButtonSpeech()
    }
}
  

extension SimpleTBLV { //speach
    
    @objc func onSearch(){
        if let textInSearch = searchController.searchBar.text, !textInSearch.isEmpty {
        } else {
            searchController.searchBar.becomeFirstResponder()
        }
    }
    
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        if isRecording {
            stopRecording()
        } else {
            startRecording()
        }
    }
 
   func changeButtonSpeech(){
       if let textInSearch = searchController.searchBar.text, !textInSearch.isEmpty {
           speechButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        } else {
            speechButton.setImage(UIImage(systemName: "mic.fill"), for: .normal)
        }
    }
    
    func startRecording() {
            //check if the speech recognizer is available. iOS 10.0+ needed
            guard let recognizer = speechRecognizer, recognizer.isAvailable else {
                print("DEBUG: Recognizer is not available")
                return
            }
            
            //Create recognitionRequest. It will provide recognition request results.
            recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
            
            //Create Audio Session. We will recode audio and Activate Audio session to start recoding.
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
            } catch {
                print("DEBUG: Audio session setup errors")
                return
            }
            
            //install an audio tap on the audio input node of the AVAudioEngine
            let inputNode = audioEngine.inputNode
            let recordingFormat = inputNode.outputFormat(forBus: 0)
            
            inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, _) in
                self.recognitionRequest?.append(buffer)
            }
            
            //Start The Audio engine
            audioEngine.prepare()
            do {
                try audioEngine.start()
            } catch {
                print("DEBUG: Audio engine start errors")
                return
            }
            
            //Create a Speech Recognition Task, Provide recognition request results
            recognitionTask = recognizer.recognitionTask(with: recognitionRequest!) { result, error in
                if let result = result {
                    let transcription = result.bestTranscription.formattedString
                    self.searchController.searchBar.text = transcription
                }
            }
            
            isRecording = true
        }
        
        func stopRecording() {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
            
            recognitionRequest?.endAudio()
            recognitionTask?.cancel()
            
            isRecording = false
        }
    
    
}




class UIKitTutorialSearchVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchFooter: SearchFooter!
    @IBOutlet var searchFooterBottomConstraint: NSLayoutConstraint!
    
    var infoList: [Info] = []
    let searchController = UISearchController(searchResultsController: nil)
    var filteredInfo: [Info] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.hidesBackButton = true

        infoList = Info.createSampleList()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        searchController.searchBar.delegate = self
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification,
                                       object: nil, queue: .main) { (notification) in
            self.handleKeyboard(notification: notification) }
        notificationCenter.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                       object: nil, queue: .main) { (notification) in
            self.handleKeyboard(notification: notification) }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    var isSearchBarEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
        return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredInfo = infoList.filter { (info: Info) -> Bool in
            return info.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    func handleKeyboard(notification: Notification) {
        // 1
        guard notification.name == UIResponder.keyboardWillChangeFrameNotification else {
            searchFooterBottomConstraint.constant = 0
            view.layoutIfNeeded()
            return
        }
        
        guard
            let info = notification.userInfo,
            let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else {
            return
        }
        
        // 2
        let keyboardHeight = keyboardFrame.cgRectValue.size.height
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.searchFooterBottomConstraint.constant = keyboardHeight
            self.view.layoutIfNeeded()
        })
    }
}

extension UIKitTutorialSearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            searchFooter.setIsFilteringToShow(filteredItemCount:
                                                filteredInfo.count, of: infoList.count)
            return filteredInfo.count
        }
        
        searchFooter.setNotFiltering()
        return infoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let info: Info
        if isFiltering {
            info = filteredInfo[indexPath.row]
        } else {
            info = infoList[indexPath.row]
        }
        cell.textLabel?.text = info.name
        cell.detailTextLabel?.text = String(info.temperature)
        return cell
    }
}

extension UIKitTutorialSearchVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

extension UIKitTutorialSearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}

class SearchFooter: UIView {
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureView()
    }
    
    override func draw(_ rect: CGRect) {
        label.frame = bounds
    }
    
    func setNotFiltering() {
        label.text = ""
        hideFooter()
    }
    
    func setIsFilteringToShow(filteredItemCount: Int, of totalItemCount: Int) {
        if (filteredItemCount == totalItemCount) {
            setNotFiltering()
        } else if (filteredItemCount == 0) {
            label.text = "No items match your query"
            showFooter()
        } else {
            label.text = "Filtering \(filteredItemCount) of \(totalItemCount)"
            showFooter()
        }
    }
    
    func hideFooter() {
        UIView.animate(withDuration: 0.7) {
            self.alpha = 0.0
        }
    }
    
    func showFooter() {
        UIView.animate(withDuration: 0.7) {
            self.alpha = 1.0
        }
    }
    
    func configureView() {
        backgroundColor = UIColor.green
        alpha = 0.0
        
        label.textAlignment = .center
        label.textColor = UIColor.white
        addSubview(label)
    }
}
