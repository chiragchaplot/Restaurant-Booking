//
//  ViewController.swift
//  RestaurantBookign
//
//  Created by Chirag Chaplot on 8/9/21.
//

import UIKit

class AddAppointmentViewController: UIViewController, UINavigationBarDelegate {

    private lazy var formContentBuilder = FormContentBuilderImplementation()
    private lazy var formCompLayout = FormCompositionalLayout()
    private lazy var dataSource = makeDataSource()
    
    private lazy var reservationCollectionView : UICollectionView  = {
        var cv = UICollectionView(frame: .zero, collectionViewLayout: formCompLayout.layout)
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.cellID)
        cv.register(FormButtonCollectionViewCell.self, forCellWithReuseIdentifier: FormButtonCollectionViewCell.cellID)
        cv.register(FormTextCollectionViewCell.self, forCellWithReuseIdentifier: FormTextCollectionViewCell.cellID)
        cv.register(FormDateCollectionViewCell.self, forCellWithReuseIdentifier: FormDateCollectionViewCell.cellID)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //addelements
        view.backgroundColor = .white
        //addElements()
        setUpCollectionView()
        updateDataSource()
    }
    
    
    
    override func loadView() {
        super.loadView()
        
    }
    
    func addElements() {
        view.addSubview(reservationCollectionView)
    }
}

// MARK: CollectionView Tasks
extension AddAppointmentViewController {

    func setUpCollectionView() {
        reservationCollectionView.dataSource = dataSource
        view.addSubview(reservationCollectionView)
        NSLayoutConstraint.activate([
            reservationCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            reservationCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            reservationCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            reservationCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    
    func makeDataSource() -> UICollectionViewDiffableDataSource<FormSectionComponent, FormComponent> {
        return UICollectionViewDiffableDataSource(collectionView: reservationCollectionView) {
            collectionView, indexPath, item in
            
            switch item {
            case is TextFormComponent:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FormTextCollectionViewCell.cellID, for: indexPath) as! FormTextCollectionViewCell
                cell.bind(item, at: indexPath)
                return cell
            case is DateFormComponent:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FormDateCollectionViewCell.cellID, for: indexPath) as! FormDateCollectionViewCell
                cell.bind(item, at: indexPath)
                return cell
            case is ButtonFormItem:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FormButtonCollectionViewCell.cellID, for: indexPath) as! FormButtonCollectionViewCell
                cell.bind(item)
                return cell
                
            default:
                return collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.cellID, for: indexPath)
                
            }
        }
    }
    
    func updateDataSource(animated: Bool = false) {
        DispatchQueue.main.async {
            [weak self] in
            
            guard let self = self else { return }
            var snapshot = NSDiffableDataSourceSnapshot<FormSectionComponent, FormComponent>()
            
            let formSections = self.formContentBuilder.content
            snapshot.appendSections(formSections)
            formSections.forEach {
                snapshot.appendItems($0.items, toSection: $0)
            }
            
            self.dataSource.apply(snapshot, animatingDifferences: animated)
        }
    }
    
}

// MARK: Move to Home Screen - Button Actions
extension AddAppointmentViewController {
    @objc func createNewAppointment() {

    }
    
    @objc func deleteAppointment() {
        
    }
    
    @objc func editAppointment() {
        
    }
}

// MARK: Present Add Appointment VC
extension AddAppointmentViewController {
    
}

