//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Hyejun Shin on 3/13/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {


    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited: Bool = false
    var tweetId: Int = -1
    var retweeted: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setFavorite(_ isFavorited: Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted: Bool){
        retweeted = isRetweeted
        if(retweeted){
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            //retweetButton.isEnabled = false
        } else {
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            //retweetButton.isEnabled = true
        }
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetId, success: {self.setFavorite(true)}, failure: {(error) in print("Favorite did not succeed \(error)")})
        } else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetId, success: {self.setFavorite(false)}, failure: {(error) in print("Unfavorite did not succeed \(error)")})
        }
    }

    @IBAction func retweet(_ sender: Any) {
        let toBeRetweeted = !retweeted
        if(toBeRetweeted){
            TwitterAPICaller.client?.retweet(tweetID: tweetId, success: {self.setRetweeted(true)}, failure: {(error) in print("Error in retweeting \(error)")})
        } else {
            TwitterAPICaller.client?.unretweet(tweetID: tweetId, success: {self.setRetweeted(false)}, failure: {(error) in print("Error in unretweeting \(error)")})
        }
    }
}
